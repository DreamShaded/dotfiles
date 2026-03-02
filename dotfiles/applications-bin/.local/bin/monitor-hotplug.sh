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
            echo "Обнаружено изменение мониторов, обновляю обои..." >&2
            "$HOME/.local/bin/set-wallpaper.sh"
        fi
    fi
done < <(xev -root -event randr 2>/dev/null)
