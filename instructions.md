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

## Claude Desktop (под i3)

Приложение ставится пакетом, а не собирается: в CachyOS оно лежит в репозитории
`cachyos` (на «чистом» Arch того же пакета нет — там понадобится AUR).

```bash
sudo pacman -S claude-desktop gnome-keyring libsecret
```

Бинарь: `/usr/bin/claude-desktop` → `/usr/lib/claude-desktop/claude-desktop`
(Electron/Chromium, ~560 МБ).

### Зачем локальный `.desktop`-оверрайд

Системный ярлык `/usr/share/applications/com.anthropic.Claude.desktop` запускает
`claude-desktop %U` без флагов. Под i3 этого мало: Chromium определяет
backend хранилища паролей по окружению рабочего стола, i3 он не опознаёт,
`safeStorage` сваливается в `backend=basic_text`, и сессия не переживает
перезапуск приложения — каждый старт требует повторного логина.

Поэтому в пакете stow `applications` лежит пользовательский оверрайд
`~/.local/share/applications/com.anthropic.Claude.desktop`, который дублирует
системный, но с явным флагом:

```
Exec=claude-desktop --password-store=gnome-libsecret %U
```

Тот же флаг продублирован в обоих `Desktop Action` (New Chat / New Claude Code
Session) и в биндах i3 — иначе запуск из i3 пойдёт мимо оверрайда.

Пользовательский каталог `~/.local/share/applications` имеет приоритет над
`/usr/share/applications`, так что переустановка пакета оверрайд не затирает.

### Что нужно в системе

1. **gnome-keyring запущен.** Демон активируется по сокету systemd --user,
   отдельно включать ничего не надо (юнит `gnome-keyring-daemon.socket`,
   `preset: enabled`).
2. **Логин-связка разблокирована при входе.** Это делает
   `pam_gnome_keyring.so auto_start` в PAM-конфиге дисплей-менеджера
   (здесь — `/etc/pam.d/ly`; для lightdm/sddm файл свой). Без этого
   Claude при каждом старте будет спрашивать пароль от связки или молча
   не сохранять сессию.
3. **Окружение проброшено в systemd/D-Bus.** В `~/.config/i3/config`:

   ```
   exec --no-startup-id dbus-update-activation-environment --systemd --all
   exec --no-startup-id systemctl --user start i3-session.target
   ```

   Первая строка отдаёт `DISPLAY`/`XAUTHORITY` в активационное окружение —
   без неё запрос пароля от связки (gcr-prompter) не сможет открыть окно.

### Хоткеи i3

Режим `open` (`$mod+o`), затем:

- `l` — запустить Claude Desktop
- `Shift+l` — открыть новую сессию Claude Code (`claude://code/new`)

### Юнит `i3-session.target`

В репозитории его нет, на новой машине создать вручную —
`~/.config/systemd/user/i3-session.target`:

```ini
[Unit]
Description=i3 session
Documentation=man:systemd.special(7)
BindsTo=graphical-session.target
Wants=graphical-session-pre.target
After=graphical-session-pre.target
```

### Диагностика (если на второй машине не работает)

```bash
# 1. Есть ли Secret Service на шине — должен отвечать gnome-keyring-d
busctl --user list | grep org.freedesktop.secrets

# 2. Активен ли сокет демона
systemctl --user is-active gnome-keyring-daemon.socket

# 3. Виден ли systemd графический сеанс (должны быть DISPLAY и XAUTHORITY)
systemctl --user show-environment | grep -E '^(DISPLAY|XAUTHORITY)'

# 4. Сохранил ли Claude свой ключ в связку (значение секрета не печатаем)
secret-tool search application Claude | grep -vE '^secret'
```

Пункт 4 при рабочей конфигурации показывает запись `Claude Safe Storage`
со схемой `chrome_libsecret_os_crypt_password_v2`. Если её нет, а пункты 1–3
зелёные — значит приложение стартовало без `--password-store=gnome-libsecret`
(запустили системный ярлык вместо оверрайда).

### Обработчик ссылок `claude://`

Схема прописана в `~/.config/mimeapps.list`:

```
x-scheme-handler/claude=com.anthropic.Claude.desktop
```

После правки `.desktop`-файлов:

```bash
update-desktop-database ~/.local/share/applications
```
