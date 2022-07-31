#
# getchoo's zshrc
#

# plugins :)
if ! [[ -e ${ZDOTDIR:-~}/.antidote ]]; then
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

# source antidote and load plugins from `${ZDOTDIR:-~}/.zsh_plugins.txt`
zhome=${ZDOTDIR:-$HOME}
if [[ ! $zhome/.zsh_plugins.zsh -nt $zhome/.zsh_plugins.txt ]]; then
  [[ -e $zhome/.antidote ]] \
    || git clone --depth=1 https://github.com/mattmc3/antidote.git $zhome/.antidote
  [[ -e $zhome/.zsh_plugins.txt ]] || touch $zhome/.zsh_plugins.txt
  (
    source $zhome/.antidote/antidote.zsh
    antidote bundle <$zhome/.zsh_plugins.txt >$zhome/.zsh_plugins.zsh
  )
fi

autoload -Uz $zhome/.antidote/functions/antidote

source $zhome/.zsh_plugins.zsh
unset zhome

# zmodules
autoload -U compinit #promptinit
zmodload zsh/complist
zstyle ':completion:*' menu select reshash true
compinit
#promptinit
#prompt walters

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
HISTSIZE=200
SAVEHIST=1000

# aliases
alias ls='exa'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
