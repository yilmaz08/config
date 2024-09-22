#!/bin/bash

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#66ffffff} off" # closed
else
  if [ $(bluetoothctl devices Connected | wc -c) -eq 0 ]
  then 
    echo " on" # not connected
  else
    
    echo "%{F#2193ff}" $(bluetoothctl devices Connected | wc -l) # connected
  fi
fi
