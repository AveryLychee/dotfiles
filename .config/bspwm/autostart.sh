#!/usr/bin/env bash
sxhkd &
compton -b -c -C -i 0.87 --shadow-exclude-reg x50+0-0
xrdb -merge ~/.Xresources
~/.fehbg
yabar &
setxkbmap -option compose:caps
