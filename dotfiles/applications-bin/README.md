# applications-bin

Пользовательские скрипты для `~/.local/bin/` (интеграции с WM/панелью, утилиты под rofi и т.д.).

## Основные опции

- **Где лежат скрипты**: `~/.local/bin/` (XDG user bin directory)

## Файлы в пакете

- `.local/bin/rofi-copyq-images` - Rofi интерфейс для CopyQ с превью изображений
- `.local/bin/systray` - Скрипт для управления stalonetray из polybar

## Примеры

- **Dry-run (без изменений)**:
  - `stow -d my-settings -t "$HOME" -n -v applications-bin`
- **Применить (создать/обновить симлинки)**:
  - `stow -d my-settings -t "$HOME" -v applications-bin`
- **Удалить симлинки пакета**:
  - `stow -d my-settings -t "$HOME" -D applications-bin`

## См. также

- `.desktop` файлы вынесены в отдельный пакет: `applications-desktop`
