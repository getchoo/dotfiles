# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
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
export PAGER='moar'
export TERM=xterm-256color

# alias
alias vim='nvim'
alias ls='exa'
alias la='ls -a'
alias g='git'

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
