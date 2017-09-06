#!/usr/bin/env sh

setxkbmap -layout $1
xmodmap ~/.swapcapslock
