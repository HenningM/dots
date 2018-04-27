#!/bin/sh -e

# Kill any existing i3lock instances
killall -q i3lock || true

# Take a screenshot
scrot /tmp/screen_locked.png

# Blur it
mogrify -grayscale Rec709Luma -blur 0x10 /tmp/screen_locked.png

lock_screen() {
  i3lock -n -i /tmp/screen_locked.png
  eval "$@"
}

xautolock -disable

# Commands to run on unlock
unlock_cmds="xautolock -enable; "

# Lock screen displaying this image.
# Mute the audio output while screen is locked.
audio_status=$(amixer sget Master | grep "\[off\]" || true)
unmute_cmd="amixer -q set Master unmute"
if [ "$audio_status" = "" ]; then
  amixer -q set Master mute
  unlock_cmds="$unlock_cmds$unmute_cmd;"
fi

# Disable notifications while screen is locked
killall -SIGUSR1 dunst # Pause dunst
resume_dunst_cmd="killall -SIGUSR2 dunst"
unlock_cmds="$unlock_cmds$resume_dunst_cmd;"

# Run i3lock & any unlock commands
lock_screen $unlock_cmds&

# Turn the screen off after a delay.
(sleep 900; pgrep i3lock && xset dpms force off)&
