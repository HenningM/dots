#!/bin/sh -e

# Take a screenshot
scrot /tmp/screen_locked.png

# Blur it
mogrify -grayscale Rec709Luma -blur 0x10 /tmp/screen_locked.png

# Lock screen displaying this image.
i3lock -i /tmp/screen_locked.png

# Turn the screen off after a delay.
sleep 900; pgrep i3lock && xset dpms force off
