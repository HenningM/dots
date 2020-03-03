#!/bin/bash -e

# Kill any existing i3lock instances
killall -q i3lock || true

# Take a screenshot
scrot /tmp/screen_locked.png

# Blur it
mogrify -scale 10% -blur 0x2.5 -resize 1000% /tmp/screen_locked.png

lock_screen() {
  i3lock -n -i /tmp/screen_locked.png
  sh "$@"
}

find_unmuted_sinks() {
  pa_sink_status="$@"
  echo "$pa_sink_status" | while read -r sink; do
    read -r sink_muted
    if [ "$sink_muted" = "no" ]; then
      echo "$sink\n"
    fi
  done
}

xautolock -disable

# Commands to run on unlock
unlock_cmds_file=$(mktemp)
echo "xautolock -enable;" >> $unlock_cmds_file

# Lock screen displaying this image.
# Mute the audio output while screen is locked.
pa_sink_status=$(pactl list sinks | grep -Ei "Name:|Mute:" | cut -d " " -f 2)
pa_sinks_to_mute=$(find_unmuted_sinks "$pa_sink_status")

echo -ne "$pa_sinks_to_mute" | while read -r sink; do
  unmute_cmd="pactl set-sink-mute $sink 0 || true"
  echo "$unmute_cmd;" >> $unlock_cmds_file
  pactl set-sink-mute $sink 1
done

# Disable notifications while screen is locked
killall -SIGUSR1 dunst # Pause dunst
resume_dunst_cmd="killall -SIGUSR2 dunst"
echo "$resume_dunst_cmd;" >> $unlock_cmds_file

# Run i3lock & any unlock commands
lock_screen $unlock_cmds_file&

# Turn the screen off after a delay.
(sleep 900; pgrep i3lock && xset dpms force off)&
