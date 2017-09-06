#!/usr/bin/env bash

show_kbd_lang() {
  color=
  lang=`setxkbmap -query | awk '/layout:/ {print $2}'`
  status=" $lang"

  if [ "$lang" = "no" ]; then
    color="#ff0000"
  fi
  i3cat encode --name kbdlang --instance "keyboard language" --color "${color}" "${status}"
}

while true; do
  show_kbd_lang
  sleep 5
done
