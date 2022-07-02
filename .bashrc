#
# getchoo's bashrc
#


# always source profile
source "$HOME/.bash_profile"

export HISTFILE="$XDG_STATE_HOME/bash/history"

# aliases
alias ls='exa'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# prompt
PS1='[\u@\h \W]\$ '
