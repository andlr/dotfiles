#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ -x $(command -v ~/.host.sh) ]
then
    source ~/.host.sh
fi

if [[ ! -v VPN_CONNECTION_NAME ]]
then
    notify-send "VPN_CONNECTION_NAME not specified"
    exit -1
fi

if $SCRIPT_DIR/is_connected.sh
then
    name=$($SCRIPT_DIR/name.sh)
    nmcli con down $VPN_CONNECTION_NAME
    notify-send "$name is down"
else
    nmcli con up $VPN_CONNECTION_NAME
    name=$($SCRIPT_DIR/name.sh)
    notify-send "$name is up"
fi

