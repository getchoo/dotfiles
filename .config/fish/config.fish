#
# getchoo's config.fish
#


function set_envvars
  # add user bin directory to path
  if test -d "$HOME/.local/bin"
    fish_add_path "$HOME/.local/bin"
  end

  # xdg dirs
  set -gx XDG_DATA_HOME "$HOME/.local/share"
  set -gx XDG_CONFIG_HOME "$HOME/.config"
  set -gx XDG_STATE_HOME "$HOME/.local/state"
  set -gx XDG_CACHE_HOME "$HOME/.cache"
  if not set -q XDG_DATA_DIRS
    set -gx XDG_DATA_DIRS "/usr/local/share/:/usr/share/"
  end
  set -gx XDG_CONFIG_DIRS "/etc/xdg"

  # default programs
  set -gx EDITOR 'nvim'
  set -gx VISUAL 'nvim'
  set -gx GPG_TTY (tty)

  # paths
  set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
  set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
  set -gx LESSHISTFILE "$XDG_STATE_HOME/less/history"
  set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"

end

function load_plugins
  if not test -f "$XDG_CONFIG_HOME/fish/functions/fisher.fish"
    echo 'bootstrapping fisher'
    curl -sL https://git.io/fisher | source && fisher update
  end
  fish_logo
end

if status is-login
  set_envvars
else if status is-interactive
  load_plugins
end
