#!/bin/bash
# note: i used `chown $USER /sys/class/backlight/.../brightness` to make this easy

usage="Usage: $0 [1-6]"

if ! echo $1 | grep -q "[1-6]"; then
  echo $usage
  exit 1
fi

bright=$(($1*20000))
echo $bright > /sys/class/backlight/intel_backlight/brightness
