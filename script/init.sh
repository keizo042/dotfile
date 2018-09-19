#!/usr/bin/env bash

# WIP

CONFIG_DIR=$HOME/.config
# CONFIG_DIR=$(cd $(dirname $0)/.. && pwd)/
SCRIPT_PATH=$(dirname $BASH_SOURCE;pwd)

CREATE_FILES=(
  $CONFIG_DIR
  $HOME/.vim
  $HOME/misc/src
)

HOME_SYMLINKS=(
  $SCRIPT_PATH/../ 
)

VIM_SYMLINKS=(
  $SCRIPT_PATH/../vimrc
  $SCRIPT_PATH/vim/user
)
	


if [ ! -e $HOME/.bashrc ]; then
ln -s $CONFIG_DIR/dotfile/bashrc $HOME/.bashrc
fi

if [ ! -e $HOME/.vimrc ]; then
ln -s $CONFIG_DIR/dotfile/vimrc $HOME/.vimrc
fi

if [ ! -L $HOME/.vim/user ]; then
    ln -s $CONFIG_DIR/dotfile/vim/user $HOME/.vim
fi

if [ ! -L $HOME/.vim/bin ]; then
    ln -s $CONFIG_DIR/dotfile/vim/bin $HOME/.vim
fi


if [ ! -L $HOME/.emacs.d ]; then
    ln -s $CONFIG_DIR/dotfile/emacs.d $HOME/.emacs.d
fi

if [ ! -L $HOME/.emacs ]; then
    ln -s $CONFIG_DIR/dotfile/emacs $HOME/.emacs
fi

if [ ! -L $HOME/.ctags ]; then
  ln -s $CONFIG_DIR/dotfile/ctags $HOME/.ctags
fi

if [ -L $HOME/.tmux.conf ];
then
  ln -s $CONFIG_DIR/dotfile/tmux.conf $HOME/.tmux.conf
fi

if [ -z "$(git config --get core.excludesfile)" ]; then
  git config --global core.excludesfile $CONFIG_DIR/dotfile/gitignore 
fi

git config --global diff.compactionHeuristic true
git config --global user.email "keizo042dev@gmail.com"
git config --global user.name "Koichi Nakanishi"
# git config --global url."https://".insteadOf git://
# git config --global url."git://".insteadOf https://
if [ ! -e "$HOME/misc/src" ]; then
  mkdir -p $HOME/misc/src
  git config --global --add ghq.root $HOME/misc/src
fi

if [ -x go ]; then
  go get github.com/alecthomas/gometalinter
fi

exit 1
