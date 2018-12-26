#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 10; done

if type "polybar"; then
  for m in $(polybar -m | cut -d":" -f1); do
    export MONITOR="$m"
    polybar -c ~/.config/polybar/config --reload example &
  done
else
  polybar -c ~/.config/polybar/config --reload example &
fi
