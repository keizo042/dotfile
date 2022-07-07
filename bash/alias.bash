#!/local/bin/env bash
alias ,,='..'
alias dc=cd
alias g=git

function aliasLinuxDefinie () {
alias l='ls -F --color=auto'
alias ls='ls -F --color=auto'
alias sl='ls -F --color=auto'
alias la='ls -aF --color=auto'
alias ll='ls -lF --color=auto'
alias s='git status'
alias m='git commit --amend'
alias p='git pull'
alias u='git push'
alias uu='git push -u -f'
alias o='gh browser --web'
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
