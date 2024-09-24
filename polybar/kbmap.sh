#!/bin/bash
echo " " $(setxkbmap -print -verbose 10 | grep layout | awk '{print $2}')
