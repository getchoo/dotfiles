#!/usr/bin/env bash
#
# getchoo's bash_profile
#

source "${HOME}/.config/shell/profile"

# add user's bin directory to path
if [ -d "${HOME}/.local/bin" ]
then
  export PATH="${HOME}/.local/bin:${PATH}"
fi
