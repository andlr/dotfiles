#!/bin/bash

if !command -v bluetoothctl &> /dev/null
then
    exit 1
fi

bluetoothctl devices Connected | head -1 | awk '{print $3}'
