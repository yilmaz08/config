#!/bin/bash
if [ $(pamixer --default-source --get-mute) == "true" ]
then
    echo " Muted" # muted
else
    echo "" $(pamixer --default-source --get-volume-human) # not muted
fi
