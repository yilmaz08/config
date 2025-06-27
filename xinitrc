#!/bin/sh

export DISPLAY=:0
source ~/.config/export.sh
exec dbus-launch dwm > /tmp/dwm.log
# exec dbus-launch bspwm > /tmp/bspwm.log
