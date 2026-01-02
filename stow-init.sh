#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
STOW_DIR="$ROOT_DIR/dotfiles"
TARGET_DIR="${HOME}"

usage() {
  cat <<'EOF'
Использование:
  ./stow-init.sh [--apply] [--force] [--backup-dir DIR] [--target DIR] [packages...]

По умолчанию выполняется пробный прогон для безопасности.

Опции:
  --apply          Выполнить stow (по умолчанию: пробный прогон)
  --force          Переместить конфликтующие существующие цели (требует --apply)
  --backup-dir DIR Куда переместить конфликтующие цели (по умолчанию: ./stow-backups/<timestamp>/)
  --target DIR     Установить целевую директорию (по умолчанию: $HOME)
  -n, --dry-run    Принудительный пробный прогон
  -h, --help       Показать справку

Примеры:
  ./stow-init.sh
  ./stow-init.sh --apply
  ./stow-init.sh --apply --force
  ./stow-init.sh --apply nvim waybar
  ./stow-init.sh --apply --force spectacle xfce
  ./stow-init.sh --apply --target /etc etc
EOF
}

APPLY=0
DRYRUN=1
FORCE=0
BACKUP_DIR=""
PACKAGES=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply)
      APPLY=1
      DRYRUN=0
      shift
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --backup-dir)
      BACKUP_DIR="${2:?--backup-dir требует значение}"
      shift 2
      ;;
    -n|--dry-run)
      APPLY=0
      DRYRUN=1
      shift
      ;;
    --target)
      TARGET_DIR="${2:?--target требует значение}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      PACKAGES+=("$@")
      break
      ;;
    -*)
      echo "Неизвестная опция: $1" >&2
      usage >&2
      exit 2
      ;;
    *)
      PACKAGES+=("$1")
      shift
      ;;
  esac
done

if ! command -v stow >/dev/null 2>&1; then
  echo "Ошибка: 'stow' не найден. Установите GNU Stow сначала." >&2
  exit 127
fi

if [[ ! -d "$STOW_DIR" ]]; then
  echo "Ошибка: директория stow не найдена: $STOW_DIR" >&2
  exit 1
fi

if [[ ${#PACKAGES[@]} -eq 0 ]]; then
  # Autodetect packages: first-level dirs in dotfiles/
  while IFS= read -r -d '' d; do
    pkg="$(basename "$d")"
    # Skip hidden dirs
    [[ "$pkg" == .* ]] && continue
    PACKAGES+=("$pkg")
  done < <(find "$STOW_DIR" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)
fi

if [[ ${#PACKAGES[@]} -eq 0 ]]; then
  echo "Пакеты не найдены в $STOW_DIR (сначала создайте dotfiles/<package>/...)." >&2
  exit 1
fi

if [[ $FORCE -eq 1 && $DRYRUN -eq 1 ]]; then
  echo "Ошибка: --force требует --apply (режим force изменяет файлы в целевой директории)." >&2
  exit 2
fi

FLAGS=(-d "$STOW_DIR" -t "$TARGET_DIR" -v)
if [[ $DRYRUN -eq 1 ]]; then
  FLAGS+=(-n)
fi

echo "директория stow : $STOW_DIR"
echo "целевая директория : $TARGET_DIR"
echo "режим     : $([[ $DRYRUN -eq 1 ]] && echo "пробный прогон" || echo "применение")"
echo "force     : $([[ $FORCE -eq 1 ]] && echo "да" || echo "нет")"
echo "пакеты    : ${PACKAGES[*]}"
echo

if [[ $FORCE -eq 0 ]]; then
  exec stow "${FLAGS[@]}" "${PACKAGES[@]}"
fi

# FORCE mode: scan conflicts, move blocking targets into backup dir, then stow.
ts="$(date +%F_%H%M%S)"
if [[ -z "$BACKUP_DIR" ]]; then
  BACKUP_DIR="$ROOT_DIR/stow-backups/$ts"
fi
if [[ "$BACKUP_DIR" != /* ]]; then
  BACKUP_DIR="$ROOT_DIR/$BACKUP_DIR"
fi

scan_out="$(
  set +e
  stow -d "$STOW_DIR" -t "$TARGET_DIR" -n -v "${PACKAGES[@]}" 2>&1
  echo "<<<STOW_EXIT:$?>>>"
  set -e
)"

targets="$(
  printf '%s\n' "$scan_out" \
    | awk '
        match($0, / existing target ([^ ]+) since/, m) { print m[1] }
        match($0, /existing target is not owned by stow: (.*)$/, m) { print m[1] }
      ' \
    | sed '/^$/d' \
    | sort -u
)"

if [[ -z "$targets" ]]; then
  # No conflicts found, just apply.
  exec stow -d "$STOW_DIR" -t "$TARGET_DIR" -v "${PACKAGES[@]}"
fi

echo "Режим force: перемещение конфликтующих целей в директорию резервных копий:"
echo "резервная копия   : $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

while IFS= read -r rel; do
  [[ -z "$rel" ]] && continue
  src="$TARGET_DIR/$rel"
  dst="$BACKUP_DIR/$rel"

  if [[ ! -e "$src" ]]; then
    continue
  fi

  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" || -L "$dst" ]]; then
    # avoid clobbering in backup dir
    dst="$dst.$ts"
  fi

  echo "  - $rel"
  mv -- "$src" "$dst"
done <<<"$targets"

echo
exec stow -d "$STOW_DIR" -t "$TARGET_DIR" -v "${PACKAGES[@]}"


