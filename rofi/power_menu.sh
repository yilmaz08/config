#!/bin/bash

options="Power Off\nReboot\nSuspend\nHibernate"

choice=$(echo -e "$options" | rofi -dmenu -p "Power Menu")

case $choice in
    "Power Off")
        loginctl poweroff
        ;;
    "Reboot")
        loginctl reboot
        ;;
	"Suspend")
		loginctl suspend
		;;
	"Hibernate")
		loginctl hibernate
		;;
    *)
        exit 1
        ;;
esac

