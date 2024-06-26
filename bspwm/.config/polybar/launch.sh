#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ "$(hostname)" = 'thinkpad' ]; then
    export CPU_TEMP_HWMON_PATH=/sys/devices/platform/thinkpad_hwmon/hwmon/hwmon5/temp1_input
fi

if [ "$(hostname)" = 'ryzen-pc' ]; then
    MONITOR=DP-0 polybar --reload main > /tmp/polybar-main.log 2>&1 &
    MONITOR=DP-4 polybar --reload satellite > /tmp/polybar-satellite.log 2>&1 &
elif [ "$(hostname)" = 'al-thinkpad' ]; then
    MONITOR=eDP polybar --reload main > /tmp/polybar-main.log 2>&1 &
    MONITOR=DisplayPort-3 polybar --reload satellite > /tmp/polybar-satellite.log 2>&1 &
elif type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main > /tmp/polybar-$m.log 2>&1 &
  done
else
  polybar --reload main > /tmp/polybar.log 2>&1 &
fi
