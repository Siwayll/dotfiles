#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


if type "xrandr"; then
  for m in $(xrandr --query | grep " connected primary" | cut -d" " -f1); do
    MONITOR=$m polybar -rq top &
    MONITOR=$m polybar -rq bottom &
  done
  for m in $(xrandr --query | grep " connected [1-9]" | cut -d" " -f1); do
    MONITOR=$m polybar -rq alt &
  done
else
  polybar -rq top &
  polybar -rq bottom &
fi


echo "Polybar launched..."
