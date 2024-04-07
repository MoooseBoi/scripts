#!/bin/sh

export DISPLAY=:1
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

STATUS=`cat /sys/class/power_supply/BAT1/status`
CAPACITY=`cat /sys/class/power_supply/BAT1/capacity`

su moose -c "notify-send $STATUS 'Capacity: $CAPACITY%'"
