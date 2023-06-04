#
# getchoo's config.fish
#

function set_envvars
	# source bash profile
	bash2env source "$HOME/.config/shell/profile"

	set -l paths "$HOME/.local/bin" \
		"$HOME/.local/share/nvim/mason/bin"

	# add user directories to path
	for path in $paths
		if test -d $path
			fish_add_path $path
		end
	end
end

function load_plugins
	if not functions -q fisher
		echo 'bootstrapping fisher'
		curl -sL https://git.io/fisher | source && fisher update
	end

	if command -q zoxide
		zoxide init fish | source
	end

	if command -q starship
		starship init fish | source
	end

	fish_config theme choose "Catppuccin Mocha"
	abbr !! --position anywhere --function last_history_item
end

if status is-interactive || status is-login
	load_plugins
	set_envvars
end

set_envvars
