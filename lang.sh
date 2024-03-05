#!/bin/sh

change_lang ()
{
  setxkbmap $1
  setxkbmap -option caps:escape  # my Esc key is broken LOL
  notify-send -u low "Changed language" $2
}

# initiate lang file
[ ! -f /tmp/lang ] && echo "us" > /tmp/lang

# get current set language
lang="$(cat /tmp/lang)"

# toggle language
case $lang in
  "us") echo "il" > /tmp/lang && change_lang il "Hebrew";;
  "il") echo "us" > /tmp/lang && change_lang us "English";;
  *) echo "us" > /tmp/lang && notify-send "lang error" "how?..."
esac
