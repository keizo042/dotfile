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


export EDITOR=vim
export PATH=$PATH:~/.local/bin
export PATH=$PATH:$HOME/misc/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:~/bin/go_appengine
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:$HOME/.opam/system/bin
export GOPATH=$HOME/misc:$HOME/bin/go_appengine/goroot
export CLOUDSDK_PYTHON=/usr/local/bin/python2
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox


if [ -e "$HOME/.config/dotfile/bash/alias.bash" ]; then
  source "$HOME/.config/dotfile/bash/alias.bash"
fi
if [ -e "$HOME/.bashrc.lib" ]; then
  source "$HONE/.config/dotfile/bash/lib.bash"
fi
if [ -e "$HOME/.bashrc.local" ]; then
    source "$HOME/.bashrc.local"
fi
bind -x '"\C-p" : cdp'
bind -x '"\C-]": cdg'
