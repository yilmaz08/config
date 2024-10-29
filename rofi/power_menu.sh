#!/bin/bash

options="Power Off\nReboot"

choice=$(echo -e "$options" | rofi -dmenu -p "Power Menu")

case $choice in
    "Power Off")
        sudo poweroff
        ;;
    "Reboot")
        sudo reboot
        ;;
    *)
        exit 1
        ;;
esac

