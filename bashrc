#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##alias ls='ls --color=auto'
export PATH=$PATH:~/.local/bin
EDITOR=vim

#

case "$TERM" in
    linux*)
#        fbterm

        ;;
    *)
        ;;
esac
if [[ "$(uname)" == "Linux" ]]; then

alias l='ls -F --color=auto'
alias ls='ls -F --color=auto'
alias sl='ls -F --color=auto'
alias la='ls -aF --color=auto'
alias ll='ls -lF --color=auto'
alias x11=startx
alias xbset='xbacklight -set'
alias pac=pacman

else

alias l='ls -F'
alias ls='ls -F'
alias sl='ls -F'
alias la='ls -aF'
alias ll='ls -lF'

fi

alias dc=cd
alias p=pwd
alias g=git
alias ,,='..'
alias cl=clear
#alias networkminer='/usr/bin/mono $HOME/bin/NetworkMiner_1-6-1/NetworkMiner.exe'
alias mrbinstall="git clone http://github.com/mruby/mruby.git"

export GOPATH=$HOME/go
export GOPATH=$GOPATH:$HOME/bin/go_appengine/goroot
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export CLOUDSDK_PYTHON=/usr/bin/python2
export PATH=$PATH:~/bin/go_appengine
#eval "$(hub alias -s)"
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:$HOME/.opam/system/bin



export EDITOR=vim

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

if [ -e $HOME/.bashrc.local ]; then
source $HOME/.bashrc.local
fi
