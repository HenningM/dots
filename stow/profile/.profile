# Enable 256 colors in terminal
if [ -e /lib/terminfo/x/xterm-256color ] && [[ $TERM != *screen* ]]; then
    export TERM='xterm-256color'
fi

export PATH=$HOME/.bin:$PATH

# Source NVM if available
export NVM_DIR=$(readlink -f "$HOME/.nvm")
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

if [ -d $HOME/.profile.d ]; then
  for p in $HOME/.profile.d/*; do source $p; done
fi

if [ "$DESKTOP_SESSION" = "i3" ]; then
  export $(gnome-keyring-daemon -s)
fi
