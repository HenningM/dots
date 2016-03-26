source $HOME/.profile

# Prompt
autoload -U colors && colors
function EXT_COLOR () { echo -ne "\033[38;5;$1m"; }
molokai_green=`EXT_COLOR 148`
molokai_purple=`EXT_COLOR 141`
molokai_grey=`EXT_COLOR 244`
export PROMPT="%{$molokai_grey%}[%?] %{$molokai_green%}%n@%m%{$reset_color%}:%{$molokai_purple%}%3~%{$reset_color%}%# "
export HISTFILE="$HOME/.zsh_history"

export EDITOR='vim'

# Aliases
alias ls="ls --color"
alias ccat="pygmentize -g -f 256 -O style=monokai"

# Emacs mode, because modal editors and command lines don't mix well
bindkey -e
