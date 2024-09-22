#!/bin/bash

if [ $(bluetoothctl show | grep PowerState | awk '{print $2}') == "on" ]
then
    bluetoothctl power off
else
    bluetoothctl power on
fi
