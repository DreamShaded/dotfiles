# systemd

Пользовательские systemd-юниты для RAG-стека (ChromaDB, Open WebUI, индексатор).

## Содержимое

| Файл | Описание |
|------|----------|
| `chromadb.service` | Векторная БД ChromaDB |
| `open-webui.service` | Веб-интерфейс Open WebUI для LLM |
| `rag-stack.target` | Цель (target), группирующая RAG-сервисы |
| `rag-watchdog.service` | Файловый наблюдатель и авто-индексатор |

## Установка

```bash
stow -d dotfiles -t ~ systemd
systemctl --user daemon-reload
systemctl --user reenable chromadb open-webui rag-watchdog rag-stack.target
```

## Управление

```bash
# Запустить весь стек
systemctl --user start rag-stack.target

# Статус
systemctl --user status rag-stack.target

# Остановить
systemctl --user stop rag-stack.target
```
