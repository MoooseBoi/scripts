#!/bin/sh

export DISPLAY=:1
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

CAPACITY=`cat /sys/class/power_supply/BAT1/capacity`
CRITICAL=10

[ $CAPACITY -le $CRITICAL ] && notify-send -u critical "Battery low" "Charge immediatly bozo >:T"
