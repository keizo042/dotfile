#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux -u

#
export BREW_PREFIX=/usr/local

if [ -f "$BREW_PREFIX/etc/bash_completion" ]; then
  source $BREW_PREFIX/etc/bash_completion
  #source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
  #export PS1='\h@\w \n[\u]\n\$ '
  export PS1='\h@\w $(__git_ps1 "(%s)")[\u]\n\$ '
else
  export PS1='\h@\w \n[\u]\n\$ '
fi

DOTFILE_ROOT=$(dirname -- "$(readlink "$BASH_SOURCE")")


DOTFILE_LIBS=(
"$DOTFILE_ROOT/bash/alias.bash"
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

bind -x '"\C-p" : source cdp'
bind -x '"\C-]" : source repo'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /Users/keizo042/google-cloud-sdk/completion.bash.inc ] && . /Users/keizo042/google-cloud-sdk/completion.bash.inc
[ -f /Users/keizo042/google-cloud-sdk/path.bash.inc ] && . /Users/keizo042/google-cloud-sdk/path.bash.inc
complete -F _git g
