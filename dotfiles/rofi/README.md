# Rofi

## Описание

Конфигурация для Rofi — универсального лаунчера приложений для Linux. Содержит настройки:

- Основной файл конфигурации
- Тема Dracula
- Настройки шрифтов и внешнего вида
- Режимы запуска: drun, window, run
- Powermenu (type-2 от adi1090x)

## Расположение файлов

После применения через `stow-init.sh`, конфигурация будет установлена в:

- `~/.config/rofi/config.rasi` — основной файл конфигурации
- `~/.config/rofi/dracula.rasi` — тема Dracula
- `~/.config/rofi/powermenu/type-2/` — powermenu (type-2 от adi1090x)
- `~/.config/rofi/colors/onedark.rasi` — цветовая схема для powermenu

## Структура пакета

```
dotfiles/rofi/
└── .config/
    └── rofi/
        ├── config.rasi
        ├── dracula.rasi
        ├── colors/
        │   └── onedark.rasi
        └── powermenu/
            └── type-2/
                ├── powermenu.sh
                ├── style-*.rasi (10 стилей)
                └── shared/
```

## Применение

```bash
./stow-init.sh --apply rofi
```

## Особенности

- **Шрифт**: FiraCodeNerdFont-Regular 16
- **Терминал**: qterminal
- **Режимы**: drun (приложения), window (окна), run (команды)
- **Тема**: Dracula с прозрачностью
- **Powermenu**: Type-2 от adi1090x с 10 стилями

## Использование

Rofi обычно вызывается через горячие клавиши в window manager (например, i3). В конфигурации i3 может быть:

```i3
bindsym $super+d exec rofi -show drun
```

Powermenu доступен через:
- Клик по модулю powermenu в polybar
- Запуск скрипта: `~/.config/rofi/powermenu/type-2/powermenu.sh`
- Можно добавить в i3: `bindsym $super+x exec ~/.config/rofi/powermenu/type-2/powermenu.sh`

## Powermenu

Powermenu type-2 предоставляет:
- Lock (блокировка экрана)
- Suspend (режим сна)
- Logout (выход из сессии)
- Reboot (перезагрузка)
- Shutdown (выключение)

Все действия требуют подтверждения. Доступно 10 стилей (style-1 до style-10), текущий стиль можно изменить в `powermenu.sh`.

