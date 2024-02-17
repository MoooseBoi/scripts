#!/bin/sh

# remap Esc
setxkbmap -option caps:escape

# background
~/.fehbg

# daemon apps
picom -b
sxhkd &
dunst &
nm-applet &
blueman-applet &
