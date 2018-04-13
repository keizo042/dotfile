#!/usr/bin/env bash

CONFIG_DIR=$HOME/.config

if [ ! -e $CONFIG_DIR ]; then
    mkdir $CONFIG_DIR
fi
if [ ! -e $HOME/.bashrc ]; then
ln -s $CONFIG_DIR/dotfile/bashrc $HOME/.bashrc
fi

if [ ! -e $HOME/.vimrc ]; then
ln -s $CONFIG_DIR/dotfile/vimrc $HOME/.vimrc
fi

if [ ! -e $HOME/.vim/ ]; then
    mkdir -p $HOME/.vim/
fi

if [ ! -L $HOME/.vim/templates ]; then
    ln -s $CONFIG_DIR/dotfile/vim/templates $HOME/.vim
fi

if [ ! -L $HOME/.vim/vimrc ]; then
    ln -s $CONFIG_DIR/dotfile/vim/vimrc $HOME/.vim
fi
if [ ! -L $HOME/.vim/bin ]; then
    ln -s $CONFIG_DIR/dotfile/vim/bin $HOME/.vim
fi


if [ ! -e $HOME/.emacs.d ]; then
    ln -s $CONFIG_DIR/dotfile/emacs.d $HOME/.emacs.d
fi

if [ ! -L $HOME/.emacs ]; then
    ln -s $CONFIG_DIR/dotfile/emacs $HOME/.emacs
fi

if [ ! -L $HOME/.ctags ]; then
  ln -s $CONFIG_DIR/dotfile/ctags $HOME/.ctags
fi

if [ -z "$(git config --get core.excludesfile)" ]; then
git config --global core.excludesfile $CONFIG_DIR/gitignore 
git config --global diff.compactionHeuristic true
git config --global user.email "keizo042dev@gmail.com"
git config --global user.name "Koichi Nakanishi"
if [ ! -e $HOME ]; then
git config --global ghq.root $HOME/src
fi
if [ ! -e $GOPATH ]; then
git config --global ghq.root $GOPATH/src
fi
echo "DS_Store" >> $CONFIG_DIR/gitignore
echo "*.o" >> $CONFIG_DIR/gitignore
echo "*.hi" >> $CONFIG_DIR/gitignore
fi

exit 1
