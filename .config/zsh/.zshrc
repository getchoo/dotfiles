#
# getchoo's zshrc
#

# bootstrap antidote
antidote_dir="$ZDOTDIR/.antidote"
plugins_file="$ZDOTDIR/.zsh_plugins.txt"
static_file="$ZDOTDIR/.zsh_plugins.zsh"
zstyle ':antidote:bundle' use-friendly-names 'yes' # don't use ugly dirs

if [[ ! "$static_file" -nt "$plugins_file" ]]
then
  [[ ! -e "$antidote_dir" ]] && \
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"

  source "$antidote_dir/antidote.zsh"
  [[ ! -e "$plugins_file" ]] && touch "$plugins_file"
  antidote bundle < "$plugins_file" > "$static_file"
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodules
autoload -U compinit colors "$antidote_dir/antidote.zsh"
colors
zmodload zsh/complist
zstyle ':completion:*' menu select reshash true
zstyle ':completion::complete:*' use-cache on

# load plugins
source "$static_file"
unset antidote_dir

# compile completion
zdump="$ZDOTDIR/.zcompdump"
compinit -d "$zdump"
if [[ ! "$zdump.zwc" -nt "$zdump" ]]
then
  zcompile "$zdump"
fi

# options
setopt append_history
setopt inc_append_history
setopt prompt_subst
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
