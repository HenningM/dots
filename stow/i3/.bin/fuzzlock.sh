#!/bin/sh -e

# Kill any existing i3lock instances
killall -q i3lock || true

# Take a screenshot
scrot /tmp/screen_locked.png

# Blur it
mogrify -grayscale Rec709Luma -blur 0x10 /tmp/screen_locked.png

# Lock screen displaying this image.
# Mute the audio output while screen is locked.
(i3lock -n -i /tmp/screen_locked.png; amixer set Master unmute)&
amixer set Master mute

# Turn the screen off after a delay.
sleep 900; pgrep i3lock && xset dpms force off
