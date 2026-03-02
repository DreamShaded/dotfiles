# applications-desktop

Пользовательские `.desktop` файлы для приложений, установленных вручную (AppImage, бинарники из `~/common/bin` и т.д.).

## Основные опции

- **Где лежат `.desktop` файлы**: `~/.local/share/applications/` (XDG user applications directory)
- **Что здесь**: 
  - `.desktop` файлы для приложений, которые не поставляются с `.desktop` файлами (например, AppImage)
- **Заметки**: после добавления/изменения `.desktop` файла может потребоваться перезапуск launcher'а (rofi/wofi/nwg-drawer) или команда `update-desktop-database ~/.local/share/applications/`

## Файлы в пакете

### Desktop файлы
- `.local/share/applications/cursor.desktop` - Cursor Editor (AppImage)
- `.local/share/applications/v2rayN.desktop` - v2rayN GUI Client

## Примеры

- **Добавить новое приложение**: создайте `.desktop` файл в этом пакете и примените stow
- **Dry-run (без изменений)**:
  - `stow -d my-settings -t "$HOME" -n -v applications-desktop`
- **Применить (создать/обновить симлинки)**:
  - `stow -d my-settings -t "$HOME" -v applications-desktop`
- **Удалить симлинки пакета**:
  - `stow -d my-settings -t "$HOME" -D applications-desktop`

## См. также

- Скрипты из `~/.local/bin/` вынесены в отдельный пакет: `applications-bin`

## Альтернативные пакеты

- Системные `.desktop` файлы обычно лежат в `/usr/share/applications/`
- Для приложений из пакетного менеджера обычно `.desktop` файлы создаются автоматически

### В контексте пакета

`stow-init.sh --apply applications-desktop --force`
`update-desktop-database ~/.local/share/applications`
`xdg-mime default cursor.desktop x-scheme-handler/cursor`