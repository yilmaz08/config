#!/bin/bash

KBMAP=$(setxkbmap -print -verbose 10 | grep layout | awk '{print $2}')
echo " " $KBMAP
