#!/usr/bin/env bash
set -eu

directory=$(xdg-user-dir VIDEOS)/recordings
filename=$(date +screen_recording_%F_%T.mp4)

mkdir -p $directory

start_recording()
{
  local OPTIND opt area
  while getopts 'sw' opt; do
    case "$opt" in
      s)
        area=$(slurp)
        wf-recorder -g "$area" -f "$directory/$filename" > /dev/null 2>&1 &
        return 0
        ;;
      w)
        area=$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')
        wf-recorder -g "$area" -f "$directory/$filename" > /dev/null 2>&1 &
        return 0
        ;;
    esac
  done

  wf-recorder -f "$directory/$filename" > /dev/null 2>&1 &
}

stop_recording()
{
  killall -q -s SIGINT wf-recorder
}

toggle_recording()
{
  if get_recording_status > /dev/null; then
    stop_recording
  else
    start_recording $@
  fi
}

get_recording_status()
{
  if pgrep wf-recorder > /dev/null; then
    echo '{"state": "Critical", "text": "󰑊 Recording"}'
    return 0
  else
    echo '{"state": "Idle", "text": "󰑊"}'
    return 1
  fi
}

notify_i3status()
{
  sleep 0.5
  pkill -RTMIN+8 i3status-rs
}

case "$1" in
  toggle)
    toggle_recording ${@:2:99}
    notify_i3status&
    exit 0
    ;;
  status)
    get_recording_status
    exit 0
    ;;
esac
