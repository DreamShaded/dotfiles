# applications

Пользовательские `.desktop` файлы и скрипты для приложений, установленных вручную (AppImage, бинарники из `~/common/bin` и т.д.).

## Основные опции

- **Где лежат `.desktop` файлы**: `~/.local/share/applications/` (XDG user applications directory)
- **Где лежат скрипты**: `~/.local/bin/` (XDG user bin directory)
- **Что здесь**: 
  - `.desktop` файлы для приложений, которые не поставляются с `.desktop` файлами (например, AppImage)
  - Пользовательские скрипты для интеграции с оконным менеджером
- **Заметки**: после добавления/изменения `.desktop` файла может потребоваться перезапуск launcher'а (rofi/wofi/nwg-drawer) или команда `update-desktop-database ~/.local/share/applications/`

## Файлы в пакете

### Desktop файлы
- `.local/share/applications/cursor.desktop` - Cursor Editor (AppImage)
- `.local/share/applications/v2rayN.desktop` - v2rayN GUI Client

### Скрипты
- `.local/bin/rofi-copyq-images` - Rofi интерфейс для CopyQ с превью изображений
- `.local/bin/systray` - Скрипт для управления stalonetray из polybar

## Примеры

- **Добавить новое приложение**: создайте `.desktop` файл в этом пакете и примените stow
- **Dry-run (без изменений)**:
  - `stow -d my-settings -t "$HOME" -n -v applications`
- **Применить (создать/обновить симлинки)**:
  - `stow -d my-settings -t "$HOME" -v applications`
- **Удалить симлинки пакета**:
  - `stow -d my-settings -t "$HOME" -D applications`

## Альтернативные пакеты

- Системные `.desktop` файлы обычно лежат в `/usr/share/applications/`
- Для приложений из пакетного менеджера обычно `.desktop` файлы создаются автоматически

