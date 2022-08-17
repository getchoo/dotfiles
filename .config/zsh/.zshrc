#
# getchoo's zshrc
#

antidote_dir="${ZDOTDIR}/.antidote"
# plugins :)
if [[ ! -d ${antidote_dir} ]]
then
  git clone https://github.com/mattmc3/antidote.git ${antidote_dir}/.antidote
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ${antidote_dir}/antidote.zsh && antidote load
unset antidote_dir

# zmodules
autoload -U compinit
zmodload zsh/complist
zstyle ':completion:*' menu select reshash true
compinit

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
HISTSIZE=100
SAVEHIST=1000

# source aliases
source "$XDG_CONFIG_HOME/shell/aliases"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
