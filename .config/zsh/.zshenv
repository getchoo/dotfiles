#
# getchoo's zshenv
#

source "${HOME}/.config/shell/profile"

# add user's bin directory to path
typeset -U path PATH

if [[ -d "${HOME}/.local/bin" ]]; then
  path=("${HOME}/.local/bin" "$path[@]")
  export PATH
fi
