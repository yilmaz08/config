#!/bin/bash

ETH_DEVICE="enp3s0"
WIFI_DEVICE="wlan0"

WIFI_IP=$(ip -4 -o addr show ${WIFI_DEVICE} | grep "scope global" | awk '{print $4}' | cut -d/ -f1)
ETH_IP=$(ip -4 -o addr show ${ETH_DEVICE} | grep "scope global" | awk '{print $4}' | cut -d/ -f1)

if [ -n "$WIFI_IP" ]; then
    if [ -n "$ETH_IP" ]; then
        echo "Both Connected";
    else
        WIFI_NAME=$(nmcli device wifi | grep "*" | awk '{print $3}')
        STRENGTH_TEXT=$(nmcli dev wifi | grep "*" | awk '{print $9}')
        let STRENGTH_NUM=$(grep -o "_" <<< ${STRENGTH_TEXT})
        echo $STRENGTH_TEXT $STRENGTH_NUM $WIFI_NAME
    fi
else
    if [ -n "$ETH_IP" ]; then
        echo "Ethernet Connected"
    else
        echo "Disconnected"
    fi
fi
