#
# getchoo's zshenv
#


# add user's bin directory to path
typeset -U path PATH

if [[ -d "$HOME/.local/bin" ]]; then
  path=("$HOME/.local/bin" "$path[@]")
  export PATH
fi

# default programs
export EDITOR='nvim'
export VISUAL='nvim'
export GPG_TTY=$TTY

# paths
export ZDOTDIR="$HOME/.config/zsh"
export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"
