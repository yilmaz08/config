#!/bin/bash
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#66ffffff}" # closed
else
  if [ $(bluetoothctl devices Connected | wc -c) -eq 0 ]
  then 
    echo "" # not connected
  else
    
    echo "%{F#59A1E8}" $(bluetoothctl devices Connected | wc -l) # connected
  fi
fi
