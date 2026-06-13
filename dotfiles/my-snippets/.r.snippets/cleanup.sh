#!/bin/bash
# Очистка диска: безопасные кеши системы и docker.
# Совместимо с bash и zsh (массивы вместо word-splitting).

# Безопасная очистка кешей и освобождение места.
# НЕ трогает npm/python/прочие пакетные менеджеры и пользовательские данные.
cleanCaches() {
  echo "🧹 Безопасная очистка кешей и освобождение места..."

  # 0. Обрывки прерванных параллельных загрузок pacman (ломают paccache)
  if find /var/cache/pacman/pkg -maxdepth 1 -name 'download-*' 2>/dev/null | grep -q .; then
    echo "→ Удаляю обрывки незавершённых загрузок pacman"
    sudo find /var/cache/pacman/pkg -maxdepth 1 -name 'download-*' -delete
  fi

  # 1. Кеш пакетов pacman/paru: храним 3 последние версии (paccache из pacman-contrib)
  if command -v paccache >/dev/null 2>&1; then
    echo "→ paccache: храню 3 последние версии установленных пакетов"
    sudo paccache -rk3
    echo "→ paccache: удаляю кеш неустановленных пакетов"
    sudo paccache -ruk0
  fi

  # 2. AUR-клоны и кеш неустановленных пакетов paru
  if command -v paru >/dev/null 2>&1; then
    echo "→ paru -Sc: чищу кеш неустановленных пакетов и AUR-клоны"
    paru -Sc --noconfirm
  fi

  # 3. Пакеты-сироты (ненужные зависимости)
  if command -v paru >/dev/null 2>&1; then
    local -a orphans
    orphans=($(paru -Qtdq 2>/dev/null))
    if (( ${#orphans[@]} )); then
      echo "→ Удаляю пакеты-сироты: ${orphans[*]}"
      paru -Rns --noconfirm "${orphans[@]}"
    else
      echo "→ Пакетов-сирот нет"
    fi
  fi

  # 4. Пользовательский build-кеш AUR-хелперов (пересоздаётся при следующей сборке)
  local d
  for d in "$HOME/.cache/paru/clone" "$HOME/.cache/yay"; do
    if [[ -d "$d" ]]; then
      echo "→ Чищу $d"
      rm -rf "${d:?}"/* 2>/dev/null
    fi
  done

  # 5. Системные логи journald
  if command -v journalctl >/dev/null 2>&1; then
    echo "→ journalctl vacuum до 200M"
    sudo journalctl --vacuum-size=200M
  fi

  # 6. Неиспользуемые рантаймы flatpak (если установлен)
  if command -v flatpak >/dev/null 2>&1; then
    echo "→ flatpak: удаляю неиспользуемые рантаймы"
    flatpak uninstall --unused -y
  fi

  # 7. Старые coredump'ы
  if [[ -d /var/lib/systemd/coredump ]]; then
    echo "→ Чищу coredump'ы"
    sudo rm -rf /var/lib/systemd/coredump/* 2>/dev/null
  fi

  echo "✅ Готово."
}

# Удалить неиспользуемые, но скачанные образы и остановленные контейнеры docker.
# Тома (volumes) НЕ трогаем — там данные.
removeAllUnusedDockers() {
  command -v docker >/dev/null 2>&1 || { echo "docker не установлен" >&2; return 1; }
  echo "🐳 Удаляю неиспользуемые образы, остановленные контейнеры, сети и build-кеш (тома сохраняю)..."
  docker system prune -af
}

# Остановить ВСЁ и удалить ВСЕ контейнеры и образы docker (тома сохраняются).
removeAllDockers() {
  command -v docker >/dev/null 2>&1 || { echo "docker не установлен" >&2; return 1; }

  local -a containers images
  containers=($(docker ps -aq))
  if (( ${#containers[@]} )); then
    echo "🐳 Останавливаю и удаляю все контейнеры..."
    docker stop "${containers[@]}" >/dev/null
    docker rm -f "${containers[@]}" >/dev/null
  fi

  images=($(docker images -aq))
  if (( ${#images[@]} )); then
    echo "🐳 Удаляю все образы..."
    docker rmi -f "${images[@]}" >/dev/null
  fi

  echo "✅ Все контейнеры и образы docker удалены (тома сохранены)."
}
