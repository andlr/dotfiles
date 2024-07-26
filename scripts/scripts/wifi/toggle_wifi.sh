#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if nmcli radio wifi | grep "disabled" > /dev/null
then
    nmcli radio wifi on
    notify-send "WiFi turned on"
else
    nmcli radio wifi off
    notify-send "WiFi turned off"
fi

