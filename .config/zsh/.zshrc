#
# getchoo's zshrc
#

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

local cache_path="${XDG_CACHE_HOME}/zsh"
local zdump="${cache_path}/zdump"
local antidote_dir="${ZDOTDIR}/.antidote"

# bootstrap antidote
if [[ ! -e "$antidote_dir/antidote.zsh" ]]
then
	git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
fi

source "${antidote_dir}/antidote.zsh"

# zmodules
autoload -Uz bashcompinit compinit # colors promptinit
# colors
# promptinit; prompt walters
zmodload zsh/zutil
zmodload zsh/complist
zstyle ':completion::*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu 'select'
zstyle ':completion:*' squeeze-slashes 'true'
zstyle ':completion::*' use-cache 'true'
zstyle ':completion::*' cache-path "$cache_path"

# load plugins
antidote load
## eval "$(zoxide init zsh)"
unset antidote_dir

# compile completion
bashcompinit
compinit -d "$zdump"
if [[ ! "${zdump}.zwc" -nt "$zdump" ]]
then
	zcompile "$zdump"
fi
unset zdump


# options
unsetopt beep
unsetopt hist_beep
unsetopt ignore_braces
unsetopt list_beep
setopt always_to_end
setopt emacs
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt prompt_subst
setopt share_history

# clear backbuffer with ctrl-l
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
HISTFILE="${XDG_STATE_HOME}/zsh/history"
HISTSIZE=100
SAVEHIST=1000

# source aliases
source "${XDG_CONFIG_HOME}/shell/aliases"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
