#!/bin/bash

if [[ "$(bluetoothctl devices Connected | wc -l)" == "0" ]]
then
    exit -1
fi

