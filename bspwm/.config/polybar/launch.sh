#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ -x $(command -v ~/.host.sh) ]
then
    source ~/.host.sh
fi

primary_monitor=$(xrandr --query | grep "primary" | cut -d" " -f1)
MONITOR=$primary_monitor polybar --reload main > /tmp/polybar-main.log 2>&1 &

for m in $(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1); do
    MONITOR=$m polybar --reload satellite > /tmp/polybar-sattelite-$m.log 2>&1 &
done

