# Enable 256 colors in terminal
if [ -e /lib/terminfo/x/xterm-256color ] && [[ $TERM != *screen* ]]; then
    export TERM='xterm-256color'
fi

export PATH=$HOME/.bin:$PATH

# Source NVM if available
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

if [ -e $HOME/.profile_local ]; then
    source $HOME/.profile_local
fi
