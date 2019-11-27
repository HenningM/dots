#!/usr/bin/env sh

if [ "$1" = "us" ]; then
  setxkbmap -layout us -variant altgr-intl -option nodeadkeys
else
  setxkbmap -layout $1
fi

xmodmap ~/.swapcapslock
