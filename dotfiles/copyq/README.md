# CopyQ

## Описание

Конфигурация для CopyQ — расширенного менеджера буфера обмена для Linux. Содержит настройки:

- Основной конфигурационный файл (copyq.conf)
- Команды и фильтры
- Темы оформления (Dracula)
- Геометрия окна и вкладки
- Настройки поведения и безопасности

## Расположение файлов

После применения через `stow-init.sh`, конфигурация будет установлена в:

- `~/.config/copyq/copyq.conf` — основной файл конфигурации
- `~/.config/copyq/copyq-commands.ini` — пользовательские команды
- `~/.config/copyq/copyq-filter.ini` — фильтры для элементов
- `~/.config/copyq/copyq-monitor.ini` — настройки мониторинга
- `~/.config/copyq/copyq_geometry.ini` — геометрия окна
- `~/.config/copyq/copyq_tabs.ini` — настройки вкладок
- `~/.config/copyq/themes/` — темы оформления (Dracula)

## Структура пакета

```
dotfiles/copyq/
└── .config/
    └── copyq/
        ├── copyq.conf
        ├── copyq-commands.ini
        ├── copyq-filter.ini
        ├── copyq-monitor.ini
        ├── copyq_geometry.ini
        ├── copyq_tabs.ini
        ├── copyq.pub
        ├── copyq.lock
        └── themes/
            └── dracula.ini
```

## Применение

```bash
./stow-init.sh --apply copyq
```

## Особенности

- **Язык интерфейса**: русский
- **Максимум элементов**: 200
- **Автозапуск**: отключен по умолчанию
- **Уведомления**: нативные уведомления системы
- **Тема**: Dracula
- **Безопасность**: защита от скриншотов, шифрование элементов

## Примечания

- Файлы `copyq.pub` и `copyq.lock` — служебные файлы, могут пересоздаваться приложением
- CopyQ может использоваться как системный сервис для мониторинга буфера обмена
- Рекомендуется настроить автозапуск через systemd или window manager

