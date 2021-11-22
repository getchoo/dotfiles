#!/bin/fish

# defaults
set -Ux EDITOR nvim
set -Ux PAGER moar

# abbrs
abbr ls exa
abbr vim nvim

# prompt
starship init fish | source
