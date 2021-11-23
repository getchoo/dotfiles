#!/bin/fish

# defaults
set -Ux VISUAL nvim
set -Ux EDITOR nvim
set -Ux PAGER moar

# prompt
starship init fish | source
