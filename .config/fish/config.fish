#
# getchoo's config.fish
#

function set_envvars
	# source bash profile
	bash2env source "$HOME/.config/shell/profile"

	# add user bin directory to path
	if test -d "$HOME/.local/bin"
		fish_add_path "$HOME/.local/bin"
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
end

if status is-interactive || status is-login
	load_plugins
	set_envvars
else
	set_envvars
end
