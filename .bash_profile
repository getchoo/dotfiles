#
# getchoo's bash_profile
#


# add user's bin directory to path
if [ -d "$HOME/.local/bin" ]
then
        export PATH="$HOME/.local/bin:$PATH"
fi

source "$HOME/.config/shell/profile"

#if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
#then
#	exec fish
#fi
