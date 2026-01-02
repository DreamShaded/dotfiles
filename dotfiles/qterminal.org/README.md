# QTerminal

## Описание

Конфигурация для QTerminal — эмулятора терминала на базе Qt. Содержит настройки:

- Конфигурация терминала (qterminal.ini)
- Закладки для быстрого доступа к серверам/директориям (qterminal_bookmarks.xml)

## Расположение файлов

После применения через `stow-init.sh`, конфигурация будет установлена в:

- `~/.config/qterminal.org/qterminal.ini` — основной файл конфигурации
- `~/.config/qterminal.org/qterminal_bookmarks.xml` — закладки терминала

## Структура пакета

```
dotfiles/qterminal.org/
└── .config/
    └── qterminal.org/
        ├── qterminal.ini
        └── qterminal_bookmarks.xml
```

## Применение

```bash
./stow-init.sh --apply qterminal.org
```

## Особенности

- Настройки внешнего вида терминала
- Цветовая схема
- Закладки для быстрого доступа к удаленным серверам и директориям
- Настройки поведения терминала

