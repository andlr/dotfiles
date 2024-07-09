#!/bin/bash

set -e

if [ -x $(command -v ~/.host.sh) ]
then
    source  ~/.host.sh
fi

if [[ ! -v BACKLIGHT_DEV ]]
then
    notify-send "BACKLIGHT_DEV not specified"
fi

if [[ "$1" == "up" ]]; then
    value="+10%"
else
    value="10%-"
fi

brightnessctl -d $BACKLIGHT_DEV set $value
updated_value=$(brightnessctl -d $BACKLIGHT_DEV | grep Current | awk -F '[()]' '{print $2}')

notify-send "Brightness: $updated_value"

