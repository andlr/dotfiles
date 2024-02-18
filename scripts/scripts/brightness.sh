#!/bin/bash

set -e

current="$(xrandr --verbose | grep Brightness | grep -o '[[:digit:]][.][[:digit:]]')"
diff=0.1

if [[ "$1" == "down" ]]; then
    new="$( bc <<<"$current - $diff" )"
else
    new="$( bc <<<"$current + $diff" )"
fi

for output in $(xrandr | grep -w connected  | awk -F'[ \+]' '{print $1}'); do
    xrandr --output $output --brightness $new
done

message=$(python3 -c "print('Brightness: ' + str(int($new * 100)) + '%')")
notify-send $message
