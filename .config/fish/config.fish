#
# getchoo's config.fish
#


# add ~/.local/bin to path if the directory exists
function add_local_bin
  set -f dir "$HOME/.local/bin"
  if test -e $dir; and not contains $dir $PATH
    fish_add_path "$HOME/.local/bin"
  end
end
add_local_bin

# default programs
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx GPG_TTY (tty)

# paths
set -gx CARGO_HOME "$HOME/.local/share/cargo"
set -gx RUSTUP_HOME "$HOME/.local/share/rustup"
