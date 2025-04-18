#!/bin/bash

if [[ "$(nmcli -t -f NAME,DEVICE,TYPE c s --active | awk -F: '$3 ~ /vpn|wireguard|ssh|openconnect|ikev2/ { print $1 }' | wc -l)" == "0" ]]
then
    exit -1
fi

