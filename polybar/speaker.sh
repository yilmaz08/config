#!/bin/bash

if [ $(pamixer --get-mute) == "true" ]
then
    echo " Muted "
else
    
    echo " " $(pamixer --get-volume-human) ""
fi
