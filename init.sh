#!/bin/sh

# environment variables
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"

# remap Esc
setxkbmap -option caps:escape

# background
~/.fehbg

# daemon apps
picom -b
sxhkd &
dunst &
blueman-applet &
