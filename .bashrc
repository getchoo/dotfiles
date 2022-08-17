#
# getchoo's bashrc
#


# always source profile
source "$HOME/.bash_profile"

# options
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s globstar
shopt -s nocaseglob
shopt -s no_empty_cmd_completion

export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTSIZE=100
export HISTFILESIZE=1000

# source aliases
source "$XDG_CONFIG_HOME/shell/aliases"

# prompt
PS1='[\u@\h \W]\$ '

#if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
#then
#  exec fish
#fi
