#!/bin/bash

ETH_DEVICE="enp3s0"
WIFI_DEVICE="wlan0"

#export signal0="󰤯 "
#export signal1="󰤟 "
#export signal2="󰤢 "
#export signal3="󰤥 "
#export signal4="󰤨 "

WIFI_IP=$(ip -4 -o addr show ${WIFI_DEVICE} | grep "scope global" | awk '{print $4}' | cut -d/ -f1)
ETH_IP=$(ip -4 -o addr show ${ETH_DEVICE} | grep "scope global" | awk '{print $4}' | cut -d/ -f1)

if [ -n "$WIFI_IP" ]; then
    if [ -n "$ETH_IP" ]; then
        echo "Both Connected";
    else
        #echo "Wifi Connected";
        WIFI_NAME=$(nmcli device wifi | grep "*" | awk '{print $3}')
        STRENGTH_TEXT=$(nmcli dev wifi | grep "*" | awk '{print $9}')
        let STRENGTH_NUM=$(grep -o "_" <<< ${STRENGTH_TEXT})
        echo $STRENGTH_TEXT $STRENGTH_NUM $WIFI_NAME
        #if (( $wifi_strength < 25 )); then
        #    echo $signal4 $WIFI_NAME;
        #elif (( $wifi_strength < 50 )); then
        #    echo $signal3 $WIFI_NAME;
        #elif (( $wifi_strength < 75 )); then
        #    echo $signal2 $WIFI_NAME;
        #elif (( $wifi_strength < 100 )); then
        #    echo $signal1 $WIFI_NAME;
        #else
        #    echo $signal0 $WIFI_NAME;
        #fi        
    fi
else
    if [ -n "$ETH_IP" ]; then
        echo "Ethernet Connected"
    else
        echo "Disconnected"
    fi
fi
