#!/bin/sh

# remap Esc
setxkbmap -option caps:escape

# background
~/.fehbg

# daemon apps
blueman-applet &
nm-applet &
sxhkd &
dunst &
incrond &
picom -b
