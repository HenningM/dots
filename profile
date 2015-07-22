# Enable 256 colors in terminal
if [ -e /lib/terminfo/x/xterm-256color ] && [[ $TERM != *screen* ]]; then
    export TERM='xterm-256color'
fi

export PATH=$HOME/.bin:$PATH

if [ -e $HOME/.profile_local ]; then
    source $HOME/.profile_local
fi

# Swap Caps Lock & Escape
xmodmap .swapCapsEsc
