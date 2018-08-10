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

bashLIBs=(
 "$HOME/.config/dotfile/bash/alias.bash"
 "$HOME/.config/dotfile/bash/lib.bash"
 "$HOME/.config/dotfile/bash/env.bash"
)

for i in ${!bashLIBs[*]}
do
  lib=${bashLIBs[i]}
  if [ -e "$lib" ];then
    source "$lib"
  fi
done

bind -x '"\C-p" : cdp'
bind -x '"\C-]": cdg'
