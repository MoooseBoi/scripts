#!/bin/sh

USER="moose"
CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
LOW_BAT=15

export DISPLAY=:1
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

notify() {
  urgency=$3
  [ "$3" = "" ] && urgency="normal"

  message="'$1' '$2'"

  su $USER -c "notify-send -u $urgency $message"
}

case $1 in
  0) notify "Discharging" "Capacity: $CAPACITY" normal && exit 0;;
  1) notify "Charging" "Capacity: $CAPACITY" normal && exit 0;;
  2) [ $CAPACITY -eq $LOW_BAT ] && notify "Low battery!!!" "" critical ;;
esac
