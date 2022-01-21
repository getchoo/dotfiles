#
# getchoo's bashrc
#


# always source profile
source "$HOME/.bash_profile"

# aliases
alias ls='exa'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# prompt
PS1='[\u@\h \W]\$ '
