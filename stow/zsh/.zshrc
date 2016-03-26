source $HOME/.zsh/zshuery/zshuery.sh
source $HOME/.profile
load_defaults
load_aliases
load_completion $HOME/.zsh/zshuery/completion
load_correction

# Prompt
autoload -U colors && colors
function EXT_COLOR () { echo -ne "\033[38;5;$1m"; }
molokai_green=`EXT_COLOR 148`
molokai_purple=`EXT_COLOR 141`
prompts '%{$molokai_green%}%n@%m%{$reset_color%}:%{$molokai_purple%}$(COLLAPSED_DIR)%{$reset_color%}%# ' ''

export EDITOR='vim'

# Aliases
alias ls="ls --color"
alias ccat="pygmentize -g -f 256 -O style=monokai"

chpwd() {
    update_terminal_cwd
}

# Emacs mode, because modal editors and command lines don't mix well
bindkey -e