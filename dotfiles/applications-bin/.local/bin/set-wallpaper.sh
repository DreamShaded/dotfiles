#!/usr/bin/env bash
# Установка обоев для каждого монитора через feh
# Читает конфиг ~/.config/wallpaper/config

set -euo pipefail

CONFIG_FILE="${HOME}/.config/wallpaper/config"

# Ассоциативный массив: монитор -> путь к обоям
declare -A WALLPAPERS

# Чтение конфига
if [[ -f "$CONFIG_FILE" ]]; then
    while IFS= read -r line; do
        # Пропуск комментариев и пустых строк
        [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
        key="${line%%=*}"
        value="${line#*=}"
        # Убрать пробелы по краям
        key="${key#"${key%%[![:space:]]*}"}"
        key="${key%"${key##*[![:space:]]}"}"
        value="${value#"${value%%[![:space:]]*}"}"
        value="${value%"${value##*[![:space:]]}"}"
        # Раскрыть тильду
        value="${value/#\~/$HOME}"
        WALLPAPERS["$key"]="$value"
    done < "$CONFIG_FILE"
else
    echo "Конфиг не найден: $CONFIG_FILE, используем обои по умолчанию" >&2
fi

# Обои по умолчанию
DEFAULT_WP="${WALLPAPERS[DEFAULT]:-$HOME/.config/i3/wallpaper.png}"

# Список подключённых мониторов (в порядке xrandr)
mapfile -t MONITORS < <(xrandr --query | grep " connected" | cut -d" " -f1)

if [[ ${#MONITORS[@]} -eq 0 ]]; then
    echo "Мониторы не обнаружены" >&2
    exit 0
fi

# Сборка аргументов для feh
FEH_ARGS=()
for mon in "${MONITORS[@]}"; do
    wp="${WALLPAPERS[$mon]:-$DEFAULT_WP}"
    if [[ -f "$wp" ]]; then
        FEH_ARGS+=("$wp")
        echo "Монитор $mon -> $wp" >&2
    else
        echo "Файл обоев не найден: $wp (монитор $mon), пропуск" >&2
    fi
done

# Применить обои
if [[ ${#FEH_ARGS[@]} -gt 0 ]]; then
    feh --bg-fill "${FEH_ARGS[@]}"
fi
