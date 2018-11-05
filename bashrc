#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] # && exec tmux

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
"$DOTFILE_ROOT/bash/env.bash"
"$HOME/.bashrc.local"
"$HOME/.bashrc.tmp"
)

for i in ${!DOTFILE_LIBS[*]}
do
  lib=${DOTFILE_LIBS[i]}
  if [ -e "$lib" ];then
    source "$lib"
  fi
done

bind -x '"\C-p" : cdp'
bind -x '"\C-]" : cdg'
bind -x '"\C-j" : cdroot'

eval "$(anyenv init -)"
eval "$(rbenv init -)"
eval "$(ndenv init -)"

export PATH=$PATH:$HOME/.anyenv/envs/ndenv/bin # for ndenv, node version manager

export PATH=$PATH:"$(npm bin -g)"
