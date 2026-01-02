# Polybar

## Описание

Конфигурация для Polybar — панели статуса для Linux. Содержит настройки:

- Две панели: top и bottom
- Модули для отображения системной информации (CPU, память, батарея, температура)
- Интеграция с i3 window manager
- Тема и цвета
- Скрипты для запуска и генерации иконок

## Расположение файлов

После применения через `stow-init.sh`, конфигурация будет установлена в:

- `~/.config/polybar/config` — основной файл конфигурации
- `~/.config/polybar/config.old` — резервная копия старой конфигурации
- `~/.config/polybar/launch.sh` — скрипт запуска polybar
- `~/.config/polybar/gen_i3_ws-icon_list.sh` — скрипт генерации иконок для рабочих пространств i3

## Структура пакета

```
dotfiles/polybar/
└── .config/
    └── polybar/
        ├── config
        ├── config.old
        ├── launch.sh
        └── gen_i3_ws-icon_list.sh
```

## Применение

```bash
./stow-init.sh --apply polybar
```

## Особенности

- **Панели**: две панели (top и bottom)
- **Модули**: файловая система, температура, CPU, память, батарея, Wi-Fi, громкость, время
- **WM**: интеграция с i3
- **Тема**: настройка цветов через xrdb или встроенные значения
- **Шрифты**: KoHo, Unifont, FontAwesome, Weather Icons, Source Code Pro

## Запуск

После применения конфигурации можно запустить polybar:

```bash
~/.config/polybar/launch.sh
```

Или добавить в автозапуск i3 (в `~/.config/i3/config`):

```i3
exec_always --no-startup-id ${HOME}/.config/polybar/launch.sh
```

