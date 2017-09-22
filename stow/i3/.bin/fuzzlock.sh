#!/bin/sh -e

# Kill any existing i3lock instances
killall -q i3lock || true

# Take a screenshot
scrot /tmp/screen_locked.png

# Blur it
mogrify -grayscale Rec709Luma -blur 0x10 /tmp/screen_locked.png

# Commands to run on unlock
unlock_cmds=""

# Lock screen displaying this image.
# Mute the audio output while screen is locked.
audio_status=`amixer sget Master | grep "\[off\]" || true`
unmute_cmd="amixer -q set Master unmute"
if [ "$audio_status" = "" ]; then
  unlock_cmds="$unlock_cmds$unmute_cmd;"
  amixer -q set Master mute
fi

# Run i3lock & any unlock
(i3lock -n -i /tmp/screen_locked.png; $unlock_cmds)&

# Turn the screen off after a delay.
sleep 900; pgrep i3lock && xset dpms force off
