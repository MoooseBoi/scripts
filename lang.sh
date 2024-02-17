#!/bin/sh

change_lang ()
{
  setxkbmap $1
  setxkbmap -option caps:escape  # my Esc key is broken LOL
  dunstify -u 0 "Changed language" $2
}

# get current set language
current="$(cat /tmp/lang)"

# initiate lang file
[ $? -eq 1 ] && echo "us" > /tmp/lang && current="us"

# toggle language
[ "$current" == "us" ] && echo "il" > /tmp/lang && change_lang il "Hebrew" 
[ "$current" == "il" ] && echo "us" > /tmp/lang && change_lang us "English"
