#
# g3tchoo's bashrc
#

# set prompt
export PS1="\[\e[36m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\] \\$ \[\e[37m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\] "

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
