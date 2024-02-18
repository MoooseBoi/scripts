#!/bin/sh

case $1 in
  0) maim | xclip -selection clipboard -t image/png;;
  1) maim "$HOME/Media/screenshots/$(date).png";;
esac
