source $HOME/.profile

# Autocompletion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' completer _complete _approximate

# Prompt
autoload -U colors && colors
function EXT_COLOR () { echo -ne "\033[38;5;$1m"; }
molokai_green=`EXT_COLOR 148`
molokai_purple=`EXT_COLOR 141`
molokai_grey=`EXT_COLOR 244`
export PROMPT="%{$molokai_grey%}[%?] %{$molokai_green%}%n@%m%{$reset_color%}:%{$molokai_purple%}%3~%{$reset_color%}%# "

# Command history
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history

export EDITOR="vim"

# Aliases
alias ls="ls --color"
alias ccat="pygmentize -g -f 256 -O style=monokai"

# Functions
function cless() {
  ccat "$1" | less -r
}

# Emacs mode, because modal editors and command lines don't mix well
bindkey -e

[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
