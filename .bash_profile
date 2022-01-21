#
# getchoo's bash_profile
#


# add user's bin directory to path
if [ -d "$HOME/.local/bin" ]
then
        export PATH="$HOME/.local/bin:$PATH"
fi

# default programs
export EDITOR='nvim'
export VISUAL='nvim'
export GPG_TTY=$TTY

# paths
export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"
