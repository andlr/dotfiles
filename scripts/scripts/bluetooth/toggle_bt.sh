#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ -x $(command -v ~/.host.sh) ]
then
    source ~/.host.sh
fi

if [[ ! -v BT_MAC ]]
then
    notify-send "BT_MAC not specified"
    exit -1
fi

if $SCRIPT_DIR/is_connected.sh
then
    name=$($SCRIPT_DIR/name.sh)
    bluetoothctl disconnect $BT_MAC
    notify-send "Disconnected $name"
else
    bluetoothctl connect $BT_MAC
    name=$($SCRIPT_DIR/name.sh)
    notify-send "Connected $name"
fi

