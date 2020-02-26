#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main > /tmp/polybar-$m.log 2>&1 &
  done
else
  polybar --reload main > /tmp/polybar.log 2>&1 &
fi
