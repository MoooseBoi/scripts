#!/bin/sh

display="$(loginctl show-session self -p Type | sed 's'/Type=//)"

[ $display == "x11" ] &&
  case $1 in
    0) maim | xclip -selection clipboard -t image/png && notify-send -u low "Saving screenshot to clipboard";;
    1) maim -s | xclip -selection clipboard -t image/png && notify-send -u low "Saving screenshot to clipboard";;
  esac

[ $display == "wayland" ] &&
  case $1 in
    0) grim | wl-copy && notify-send -u low "Saving screenshot to clipboard";;
    1) grim -g "$(slurp)" | wl-copy && notify-send -u low "Saving screenshot to clipboard";;
  esac
