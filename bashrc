#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:$HOME/.opam/system/bin
EDITOR=vim
alias b=bkmark
alias br='hub browse'
alias dc=cd
alias p=pwd
alias g=git
alias gg='ghq get'
alias c='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias gls='git ls-files'
alias ,,='..'
alias cl=clear
alias cdp='cd $(find $(pwd) | peco)'
#alias networkminer='/usr/bin/mono $HOME/bin/NetworkMiner_1-6-1/NetworkMiner.exe'
alias vhasktag="hasktags --ignore-close-implementation --ctags"
if [[ "$(uname)" == "Linux" ]]; then

alias l='ls -F --color=auto'
alias ls='ls -F --color=auto'
alias sl='ls -F --color=auto'
alias la='ls -aF --color=auto'
alias ll='ls -lF --color=auto'
alias xbset='xbacklight -set'

else

alias l='ls -F'
alias ls='ls -F'
alias sl='ls -F'
alias la='ls -aF'
alias ll='ls -lF'

fi
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  export PS1='\h@\w $(__git_ps1 "(%s)")\n[\u]\n\$ '
else
  export PS1='\h@\w \n[\u]\n\$ '
fi

function cdg() {
  local selected_file=""
  selected_file="$(ghq list --full-path | peco --query "$LBUFFER")"
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      cd "${selected_file}" || return
    fi
  fi
}

sdc () {
docker-machine start "$1"
}

edc () {
eval "$(docker-machine env "$1")"
}

idc () {
    sdc "$@"
    edc "$@"
}

function v() {
  vim -p "$(ls -a | peco)"
}

function xvi() {
  vim -p "$(cat -)" "$@" < /dev/tty
}

function mkrepo {
  local DEFAULT_HOST="github.com"
  local DEFAULT_AUTHOR="keizo042"
  local REPO_HOST=""
  local REPO_AUTHOR=""
  local REPO_NAME=""
  local GHQ_ROOT=$HOME/misc/src
  local REPO=""
  local CUR_DIR=""
  if [ "1" -eq "$#" ]; then
    REPO_HOST=$DEFAULT_HOST
    REPO_AUTHOR=$DEFAULT_AUTHOR
    REPO_NAME=$1
  elif [ "2" -eq "$#" ]; then
    REPO_HOST=$DEFAULT_HOST
    REPO_AUTHOR=$1
    REPO_NAME=$2
  elif [ "3" -eq "$#" ]; then
    REPO_HOST=$1
    REPO_AUTHOR=$2
    REPO_NAME=$3
  else
    printf "usage: [hostname] [org/author name] repository\n" 1>&2
    printf "\n" 1>&2
    printf "hostname\tupload hostname (default: %s)\n" "$DEFAULT_HOST" 1>&2
    printf "org/author name\torgnization author name (default: %s)\n" "$DEFAULT_AUTHOR" 1>&2
    printf "repository\trepository name\n" 1>&2
    return
  fi
  REPO="${GHQ_ROOT}/${REPO_HOST}/${REPO_AUTHOR}/${REPO_NAME}"
  CUR_DIR="$(pwd)"
  if [ ! -e "$REPO" ]; then
    mkdir "$REPO"
  fi
  cd "$REPO" || return
  if [ ! -e "$REPO/.git" ]; then
    git init
  fi
  cd "${CUR_DIR}" || return
}

function initrepo() {
  FILES="README.md LICENSE .gitignore"
  for f in $FILES ; do
    touch "$f" || return
  done
}

function rmrepo() {
  local DEFAULT_HOST="github.com"
  local DEFAULT_AUTHOR="keizo042"
  local REPO_HOST=""
  local REPO_AUTHOR=""
  local REPO_NAME=""
  local GHQ_ROOT=$HOME/misc/src
  local REPO=""
  local CUR_DIR=""
  if [ "1" -eq "$#" ]; then
    REPO_HOST=$DEFAULT_HOST
    REPO_AUTHOR=$DEFAULT_AUTHOR
    REPO_NAME=$1
  elif [ "2" -eq "$#" ]; then
    REPO_HOST=$DEFAULT_HOST
    REPO_AUTHOR=$1
    REPO_NAME=$2
  elif [ "3" -eq "$#" ]; then
    REPO_HOST=$1
    REPO_AUTHOR=$2
    REPO_NAME=$3
  else
    printf "usage: [hostname] [org/author name] repository\n" 1>&2
    printf "\n" 1>&2
    printf "hostname\tupload hostname (default: %s)\n" "$DEFAULT_HOST" 1>&2
    printf "org/author name\torgnization author name (default: %s)\n" "$DEFAULT_AUTHOR" 1>&2
    printf "repository\trepository name\n" 1>&2
    return
  fi
  REPO="${GHQ_ROOT}/${REPO_HOST}/${REPO_AUTHOR}/${REPO_NAME}"
  rm "$REPO"
}


export PATH=$PATH:~/.local/bin
export PATH=$PATH:$HOME/misc/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:~/bin/go_appengine
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:$HOME/.opam/system/bin
export GOPATH=$HOME/misc:$HOME/bin/go_appengine/goroot
export CLOUDSDK_PYTHON=/usr/local/bin/python2

# The next line updates PATH for the Google Cloud SDK.
#source '$HOME/bin/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
#source '$HOME/bin/google-cloud-sdk/completion.bash.inc'

#chrome sandbox 
# pre command
# find chrome-sandbox
#cp it /usr/local/sbin/chrome-devel-sandbox
#on your shell
#sudo chown root:root /usr/local/sbin/chrome-devel-sandbox
#sudo chmod 4755 /usr/local/sbin/chrome-devel-sandbox
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox

bind -x '"\C-p" : cdp'
bind -x '"\C-]": cdg'

if [ -e "$HOME/.bashrc.local" ]; then
    source "$HOME/.bashrc.local"
fi
