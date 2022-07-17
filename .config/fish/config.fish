#
# getchoo's config.fish
#


function set_envvars
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
  set -gx AUR_PAGER 'fff'
  set -gx AUR_EXEC_PATH "$XDG_DATA_HOME/aurutils/lib:/usr/lib/aurutils"

  # flags
  set -gx CFLAGS "-march=native -mtune=native -O3 -pipe -fno-plt -fexceptions \
          -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security \
          -fstack-clash-protection -fcf-protection"
  set -gx CXXFLAGS "$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
  set -gx LDFLAGS "-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
  set -gx LTOFLAGS "-flto=12"
  set -gx RUSTFLAGS "-C target-cpu=native -C opt-level=3"
  set -gx MAKEFLAGS "-j12"

  # paths
  set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
  set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
  set -gx LESSHISTFILE "$XDG_STATE_HOME/less/history"
  set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"

end

function load_plugins
  starship init fish | source
end

if status is-login
  set_envvars
  load_plugins
else if status is-interactive
  load_plugins
else
  set_envvars
end
