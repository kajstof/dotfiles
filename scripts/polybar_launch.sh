#!/usr/bin/env bash

# Default profile
profile="primary"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "polybar"; then
  count=0
  # for m in $(polybar -m | cut -d":" -f1 | tac); do
  for m in $(polybar -m | cut -d":" -f1); do
    export MONITOR="$m"
    if [ $count -gt 0 ]; then
      profile="secondary"
    fi
    polybar -c ~/.config/polybar/config --reload $profile &
    ((count=count+1))
    sleep 0.5
  done
else
  polybar -c ~/.config/polybar/config --reload $profile &
fi
