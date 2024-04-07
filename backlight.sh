#!/bin/bash
# note: the limit 1 - 6 was chosen by hand since max brightness is 120000. (hence brightness = $1 * 20000)
# feel free to change this as you wish

usage="Usage: $0 [1-6]"

if [[ ! "$1" =~ ^[1-6]$ ]]; then
  echo $usage
  exit 1
fi
echo test
exit 0

bright=$(($1*20000))
echo $bright | sudo tee /sys/class/backlight/intel_backlight/brightness
