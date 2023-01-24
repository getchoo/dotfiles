#
# getchoo's zshenv
#
source "${HOME}/.config/shell/profile"

# add user directories to path
typeset -U paths=("$HOME/.local/bin" \
	"$HOME/.local/share/nvim/mason/bin" \
)

typeset -U path

for p in "${paths[@]}"; do
	[[ -d "$p" ]] && \
		path=("$p" "$path[@]")
done

zstyle ':antidote:bundle' use-friendly-names 'yes' # don't use ugly dirs
