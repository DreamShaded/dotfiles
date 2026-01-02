#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Detect network interfaces
WIRELESS_NAME=$(ip -o link show | awk -F': ' '{print $2}' | grep -E '^(wlan|wlp|wifi)' | head -1)
ETH_NAME=$(ip -o link show | awk -F': ' '{print $2}' | grep -E '^(enp|eth|en)' | head -1)

# Export for polybar
export WIRELESS_NAME
export ETH_NAME

if type "xrandr"; then
  # Launch mybar for each monitor
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
    MONITOR=$m polybar --reload bottom &
  done
else
  # Launch mybar
  polybar --reload top &
  polybar --reload bottom &
fi

echo "Bars launched..."
