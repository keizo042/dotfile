#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  export PS1='\h@\w $(__git_ps1 "(%s)")\n[\u]\n\$ '
else
  export PS1='\h@\w \n[\u]\n\$ '
fi

DOTFILE_ROOT=$(dirname -- "$(readlink "$BASH_SOURCE")")


DOTFILE_LIBS=(
"$DOTFILE_ROOT/bash/alias.bash"
"$DOTFILE_ROOT/bash/lib.bash"
"$DOTFILE_ROOT/.config/dotfile/bash/env.bash"
)

for i in ${!DOTFILE_LIBS[*]}
do
  lib=${DOTFILE_LIBS[i]}
  if [ -e "$lib" ];then
    source "$lib"
  fi
done

bind -x '"\C-p" : cdp'
bind -x '"\C-]": cdg'
