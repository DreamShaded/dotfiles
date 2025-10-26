# Настройка линухса

Набор конфигураций и сниппетов для чистой установки на Manjaro i3.
Включает в себя настройки гита, zsh (без скинов), конфиг для i3 и i3status,
плюс мои привычные алиасы для команд.

## Установка:
1. Исправить имя и почту в [.gitconfig](./.gitconfig)
2. Добавить токены в .npmrc, .yarnrc
3. Выполнить ```python install.py```
4. pacman-add redshift kwallet kwallet-pam qterminal flameshot libpeas zeitgeist gobject-introspection meson vala xorg-server-xvfb libayatana-appindicator mplayer fzf xorg-xinput qbittorrent flatpak libpamac-flatpak-plugin bluez bluez-utils blueman fzf zsh vim xorg-xrandr base-devel volumeicon i3 i3status nwg-look
5. Скачать [obsidian.Appimage](https://obsidian.md/download) в .local/bin/obsidian.AppImage, зачмодиксить
6. Обновить джс менеджеры ```bash npm i -g yarn pnpm npm ```
7. Выбрать желаемую тему: ```bash nwg-look```

