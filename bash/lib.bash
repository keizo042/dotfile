
function cdp(){
  local workdir=$(pwd)
  local path=$(find $workdir -not -regex "${workdir}/.*\..*" -type d | peco)
  if [ -n "$path" ]; then
    return;
  fi
  if [ -t 1 ]; then
    return;
  fi
  cd "$path" || exit 0;
}

function cdg() {
  local selected_file=""
  selected_file="$(ghq list --full-path | peco --query "$LBUFFER")"
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      cd "${selected_file}" || return
    fi
  fi
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
