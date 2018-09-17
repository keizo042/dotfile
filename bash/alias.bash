#!/local/bin/env bash
alias ,,='..'
alias p=pwd
alias cl=clear
alias dc=cd

alias g=git
alias gp='git pul'
alias gf='git fetch'
alias gg='ghq get'
alias br='hub browse'
alias c='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'

alias vhasktag="hasktags --ignore-close-implementation --ctags"
alias phptag='ctags -R --regex-php="/^[ \t]*const[ \t]+([a-z0-9_]+)/\1/d/i"'


function aliasLinuxDefinie () {
alias l='ls -F --color=auto'
alias ls='ls -F --color=auto'
alias sl='ls -F --color=auto'
alias la='ls -aF --color=auto'
alias ll='ls -lF --color=auto'
alias xbset='xbacklight -set'
}

function aliasDarwinDefine () {

alias l='ls -F'
alias ls='ls -F'
alias sl='ls -F'
alias la='ls -aF'
alias ll='ls -lF'
}

if [[ "$(uname)" == "Darwin" ]]; then
  aliasDarwinDefine

else
  aliasLinuxDefinie
fi
