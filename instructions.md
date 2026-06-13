# Инструкции по установке

## Установка базовых пакетов

### Pacman

```bash
sudo pacman -S \
  cuda cudnn \
  telegram-desktop dmenu \
  docker docker-buildx docker-compose \
  steam mangohud lib32-mangohud \
  wine-cachyos proton-cachyos gamescope lutris gamemode lib32-gamemode \
  ollama-cuda \
  qterminal git \
  flameshot copyq stow \
  chromium \
  obsidian obs-studio \
  rclone \
  xorg-xset gnome-keyring libsecret \
  polybar redshift \
  xdo xdotool stalonetray \
  fzf \
  zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-history-substring-search \
  mousepad \
  php composer \
  mcfly \
  woff2-font-awesome noto-fonts nitrogen \
  python python-pip uv
```

### Paru (AUR)

```bash
paru -S \
  google-chrome zoom \
  ttf-weather-icons ttf-paratype noto-fonts-extra ttf-dejavu ttf-symbola \
  open-webui searxng-git
```

### Обновить кэш шрифтов

```bash
fc-cache -fv
```

## Ollama (systemd override)

Открыть оверрайд для сервиса:

```bash
sudo systemctl edit ollama.service
```

Вставить:

```ini
[Service]
Environment="OLLAMA_HOST=0.0.0.0"
Environment="OLLAMA_ORIGINS=*"
Environment="OLLAMA_MAX_LOADED_MODELS=1"
Environment="OLLAMA_KEEP_ALIVE=5m"
Environment="OLLAMA_FLASH_ATTENTION=1"
Environment="OLLAMA_KV_CACHE_TYPE=q8_0"
Environment="OLLAMA_NUM_PARALLEL=1"
```

Применить изменения:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

### Скачать модели

```bash
ollama pull qwen3:8b
ollama pull bge-m3
ollama pull qwen2.5vl:3b
```

## Open WebUI (systemd unit)

Создать/отредактировать юнит:

```bash
sudo vim /etc/systemd/system/open-webui.service
```

Содержимое:

```ini
[Unit]
Description=Open WebUI
After=network.target ollama.service
Wants=ollama.service

[Service]
Type=simple
User=raguser
ExecStart=/opt/open-webui-env/bin/open-webui serve
Restart=on-failure
RestartSec=5
Environment="HOST=0.0.0.0"
Environment="PORT=8080"
Environment="OLLAMA_BASE_URL=http://localhost:11434"
Environment="VECTOR_DB=chroma"
Environment="ENABLE_RAG_WEB_SEARCH=True"
Environment="RAG_WEB_SEARCH_ENGINE=searxng"
Environment="SEARXNG_QUERY_URL=http://localhost:8888/search?q=<query>&format=json"

[Install]
WantedBy=multi-user.target
```

Включить и запустить:

```bash
sudo systemctl enable --now open-webui.service
```

## SearXNG

Открыть настройки:

```bash
sudo vim /etc/searxng/settings.yml
```
