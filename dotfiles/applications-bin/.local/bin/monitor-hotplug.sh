#!/usr/bin/env bash
# Демон: следит за подключением/отключением мониторов
# При изменении — перезапускает обои через set-wallpaper.sh

PIDFILE="${XDG_RUNTIME_DIR:-/tmp}/monitor-hotplug.pid"
COOLDOWN=2  # секунды между срабатываниями

# Убить предыдущий экземпляр
if [[ -f "$PIDFILE" ]]; then
    old_pid=$(cat "$PIDFILE" 2>/dev/null)
    if [[ -n "$old_pid" ]] && kill -0 "$old_pid" 2>/dev/null; then
        # Убить дочерний xev, затем сам демон
        pkill -P "$old_pid" 2>/dev/null || true
        kill "$old_pid" 2>/dev/null
        wait "$old_pid" 2>/dev/null || true
    fi
fi

# Записать текущий PID
echo $$ > "$PIDFILE"

# Очистка при выходе
cleanup() {
    rm -f "$PIDFILE"
}
trap cleanup EXIT

last_run=0

# Слушаем события randr через xev (process substitution для сохранения переменных)
while read -r line; do
    if [[ "$line" == *"RRScreenChangeNotify"* ]]; then
        now=$(date +%s)
        elapsed=$((now - last_run))
        if [[ $elapsed -ge $COOLDOWN ]]; then
            last_run=$now
            echo "Обнаружено изменение мониторов, обновляю конфиг..." >&2
            # Переподключение монитора может реактивировать DPMS — сразу отключаем
            xset s off s noblank -dpms dpms 0 0 0
            # xrandr --auto нужен чтобы NVIDIA подхватил мониторы после переподключения
            xrandr --auto
            # Если внешние мониторы подключены — выстраиваем: ViewSonic(DP-1-2) | Dell(DP-1-0) | eDP-1
            dp10=$(xrandr --query | grep "^DP-1-0 connected")
            dp12=$(xrandr --query | grep "^DP-1-2 connected")
            if [[ -n "$dp10" && -n "$dp12" ]]; then
                xrandr --output DP-1-2 --auto --primary \
                       --output DP-1-0 --auto --right-of DP-1-2 \
                       --output eDP-1  --auto --right-of DP-1-0
            fi
            "$HOME/.local/bin/set-wallpaper.sh"
        fi
    fi
done < <(xev -root -event randr 2>/dev/null)
