#!/bin/sh

display="$(loginctl show-session self -p Type | sed 's'/Type=//)"

[ $display == "x11" ] &&
case $1 in
  0) maim -s | xclip -selection clipboard -t image/png && notify-send -u low "Saving screenshot to clipboard";;
  1) filename="$HOME/Media/screenshots/$(date).png" && maim -s $filename && notify-send -u low "Saving screenshot" "at $filename";;
esac

[ $display == "wayland" ] &&
case $1 in
  1) grim -g "$(slurp)" | wl-copy && notify-send -u low "Saving screenshot to clipboard";;
  2) grim -g "$(slurp)" -o "$HOME/Media/screenshots/$(date).png" && notify-send -u low "Saving screenshot" "at $filename";;
esac
