#!/bin/sh
export DISPLAY=:0
source ~/.config/export.sh
exec dbus-launch bspwm > /tmp/bspwm.log
