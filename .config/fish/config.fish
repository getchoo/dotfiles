#!/bin/fish

# defaults
set -Ux VISUAL nvim
set -Ux EDITOR nvim
set -Ux GIT_PAGER moar
set -Ux PAGER moar

# abbrs
abbr dotfiles 'git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
abbr orphans 'sudo pacman -Rns (pacman -Qtdq)'

# prompt
starship init fish | source
