# Enable true colors in terminal
if [ -e /lib/terminfo/x/xterm-kitty ]; then
    export TERM='xterm-kitty'
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
