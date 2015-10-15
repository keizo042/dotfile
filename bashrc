#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
export PATH=$PATH:~/.local/bin
EDITOR=vim

#
#PS1='[\u@\h \W]\$ '

case "$TERM" in
    linux*)
#        fbterm

        ;;
    *)
        ;;
esac

alias l='ls -F --color=auto'
alias ls='ls -F --color=auto'
alias sl='ls -F --color=auto'
alias la='ls -aF --color=auto'
alias ll='ls -lF --color=auto'
alias x11=startx
alias dc=cd
alias p=pwd
alias g=git
alias ,,='..'
alias cl=clear
alias pac=pacman
alias xbset='xbacklight -set'
alias networkminer='/usr/bin/mono /home/keizo/bin/NetworkMiner_1-6-1/NetworkMiner.exe'
alias mrbinstall="git clone http://github.com/mruby/mruby.git"
alias h2spec='$GOPATH/src/github.com/summerwind/h2spec/cmd/cmd'
alias ghr='$HOME/bin/ghr/ghr'
alias direnv="~/bin/direnv/direnv"

export GOPATH=$HOME/go
export GOPATH=$GOPATH:$HOME/bin/go_appengine/goroot
export PATH=$PATH:$HOME/go/bin
export CLOUDSDK_PYTHON=/usr/bin/python2
export PATH=$PATH:~/bin/go_appengine
#eval "$(hub alias -s)"
export PATH=$PATH:~/bin/ghc-mod/.cabal-sandbox/bin
#export PATH=$PATH:/home/keizo/.gem/ruby/2.1.0/bin
export PATH=$PATH:/home/keizo/.gem/ruby/2.2.0/bin
export PATH=$PATH:/home/keizo/bin/mruby/bin
export PATH=$PATH:~/bin
export PATH=$PATH:~/bin/build/.cabal-sandbox/bin
export PATH=$PATH:~/bin/darcs/.cabal-sandbox/bin
export PATH=$PATH:~/bin/gtk2hs-buildtools/.cabal-sandbox/bin
export PATH=$PATH:~/.local/bin



export EDITOR=vim
# ctags -R include/mrbconf.h include/mrbconf.h include/mruby/*.h mrbgems/mruby-*/src/*.h mrbgems/mruby-*/src/*.c src/*.c src/*.h 

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

source $HOME/.bashrc.local
