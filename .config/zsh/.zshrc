#
# getchoo's zshrc
#


# zmodules
autoload -U compinit promptinit
zmodload zsh/complist
zstyle ':completion:*' menu select reshash true
compinit
promptinit
prompt walters

# options
setopt append_history
setopt inc_append_history
setopt share_history

# binds
bindkey -e

## clear backbuffer with ctrl-l
function clear-screen-and-scrollback() {
    echoti civis >"$TTY"
    printf '%b' '\e[H\e[2J' >"$TTY"
    zle .reset-prompt
    zle -R
    printf '%b' '\e[3J' >"$TTY"
    echoti cnorm >"$TTY"
}

zle -N clear-screen-and-scrollback
bindkey '^L' clear-screen-and-scrollback

# enable history
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=20
SAVEHIST=500

# aliases
alias ls='exa'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
