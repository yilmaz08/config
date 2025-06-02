#!/bin/bash
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  # echo "%{F#66ffffff}" # closed
  echo "%{F#394b70}" # closed
else
  if [ $(bluetoothctl devices Connected | wc -c) -eq 0 ]
  then 
    echo "" # not connected
  else
    echo "%{F#7aa2f7}" $(bluetoothctl devices Connected | wc -l) # connected
  fi
fi
