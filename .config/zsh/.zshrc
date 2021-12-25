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

# alias
alias vim='nvim'
alias ls='exa'
alias la='ls -a'
alias g='git'
alias dotfiles='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias orphans='pacman -Qtdq | sudo pacman -Rns -'

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
eval $(starship init zsh)

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
#[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
