#!/usr/bin/env bash
#
# getchoo's bash_profile
#

source "${HOME}/.config/shell/profile"


declare -a paths=("$HOME/.local/bin" \
	"$HOME/.local/share/nvim/mason/bin" \
)

# add user's bin directory to path
for path in "${paths[@]}"; do
	[ -d "$path" ] && \
		export PATH="$path:${PATH}"
done

source "${HOME}/.bashrc"
