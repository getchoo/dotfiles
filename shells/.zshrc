#
# g3tchoo's zshrc
#

# completion 
autoload -U compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
compinit

# options
setopt autocd
setopt appendhistory
setopt sharehistory
setopt incappendhistory
set -o emacs

# enable history
HISTFILE="$HOME/.cache/zsh/history"
HISTSIZE=100
SAVEHIST=1000

# defaults
export EDITOR='nvim'
export VISUAL='nvim'
export TERM=xterm-256color

# alias
alias vim='nvim'
alias ls='exa'
alias la='ls -a'
alias g='git'

source $HOME/.local/share/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
eval "$(starship init zsh)"
