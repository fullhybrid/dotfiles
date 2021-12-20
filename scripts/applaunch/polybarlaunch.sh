#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -l info --reload bar1 &
  done
else
  polybar -l info --reload bar1 &
fi

# Launch bar1 and bar2
#polybar bar1 &
#polybar bar2 &

echo "Bars launched..."
