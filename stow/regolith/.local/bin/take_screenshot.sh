#!/usr/bin/env bash
set -eu

directory=$(xdg-user-dir PICTURES)/screenshots
filename=$(date +screenshot_%F_%T.png)

mkdir -p $directory

while getopts 'sw' opt; do
  case "$opt" in
    s)
      grim -g "$(slurp)" $directory/$filename
      exit 0
      ;;
    w)
      grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" $directory/$filename
      exit 0
      ;;
  esac
done

grim $directory/$filename
