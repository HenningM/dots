# Enable SSH auth thorugh gnome-keyring-daemon
SSH_AUTH_SOCK=`ss -xl | grep -o '/tmp/keyring-.*/ssh'`
[ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK

# Enable 256 colors in terminal
if [ -e /lib/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

export PATH=$HOME/.bin:$PATH

source $HOME/.profile_local
