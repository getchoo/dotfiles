#
# g3tchoo's bashrc
#

# set prompt
export PS1='\[\e[0;93m\][\[\e[0;96m\]\u\[\e[0;95m\]@\[\e[0;96m\]\h \[\e[0;92m\]\w\[\e[0;93m\]]\[\e[0;90m\]$\[\e[0m\] '

# options
shopt -s autocd
shopt -s dotglob
shopt -s histappend
set -o emacs

# defaults
export EDITOR='nvim'
export VISUAL='nvim'
export TERM=xterm-256color

# alias
alias vim='nvim'
alias ls='exa'

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
