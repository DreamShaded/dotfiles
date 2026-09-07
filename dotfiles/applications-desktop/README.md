# applications-desktop

Пользовательские `.desktop` файлы: для приложений, установленных мимо пакетного
менеджера (AppImage, бинарники), и оверрайды системных ярлыков.

Раньше рядом жил дублирующий пакет `applications` с теми же `v2rayN`/`stacher` —
одновременно раскатать оба было нельзя (конфликт симлинков), поэтому он влит сюда.

## Основные опции

- **Куда раскатывается**: `~/.local/share/applications/` (XDG user applications directory)
- **Приоритет**: этот каталог перекрывает `/usr/share/applications/` по имени файла,
  так что переустановка пакета оверрайд не затирает — но и обновления апстримного
  ярлыка сюда не приезжают, синхронизировать руками.
- **Заметки**: после добавления/изменения `.desktop` файла может потребоваться
  `update-desktop-database ~/.local/share/applications/` и перезапуск launcher'а
  (rofi/wofi/nwg-drawer).

## Файлы в пакете

- `.local/share/applications/browseros.desktop` — BrowserOS
- `.local/share/applications/com.anthropic.Claude.desktop` — **оверрайд** системного
  ярлыка Claude Desktop: добавляет `--password-store=gnome-libsecret`, без которого
  под i3 Chromium не опознаёт DE, `safeStorage` уходит в `backend=basic_text`
  и сессия не переживает перезапуск. Подробнее — `instructions.md`, раздел
  «Claude Desktop (под i3)».
- `.local/share/applications/stacher.desktop` — Stacher (загрузчик)
- `.local/share/applications/v2rayN.desktop` — v2rayN GUI Client
- `.local/share/applications/mimeapps.list` — пустой; фактические ассоциации
  живут в `~/.config/mimeapps.list`, который пока не под stow

`mimeinfo.cache` в пакете не хранится (генерируется `update-desktop-database`,
добавлен в `.gitignore`).

## Примеры

- **Dry-run (без изменений)**:
  - `stow -d dotfiles -t "$HOME" -n -v applications-desktop`
- **Применить (создать/обновить симлинки)**:
  - `stow -d dotfiles -t "$HOME" --no-folding -R applications-desktop`
- **Удалить симлинки пакета**:
  - `stow -d dotfiles -t "$HOME" -D applications-desktop`
- **Или через обёртку репозитория**:
  - `./stow-init.sh --apply applications-desktop`

`--no-folding` нужен потому, что в `~/.local/share/applications/` лежат и чужие
файлы (ярлыки, созданные самими приложениями) — каталог целиком в симлинк
превращать нельзя.

## См. также

- Скрипты из `~/.local/bin/` — в пакете `applications-bin`
- Системные `.desktop` файлы — `/usr/share/applications/`

## Регистрация схемы URL

`xdg-mime default com.anthropic.Claude.desktop x-scheme-handler/claude`
