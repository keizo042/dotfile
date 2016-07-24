#!/usr/bin/env bash

CONFIG_DIR=$HOME/.conf
if [ ! -e $HOME/.bashrc ]; then
ln -s $CONFIG_DIR/dotfile/bash $HOME/.bashrc
fi

if [ ! -e $HOME/.vimrc ]; then
ln -s $CONFIG_DIR/dotfile/vimrc $HOME/.vimrc
fi

if [ ! -e $HOME/.vim/ ]; then
    mkdir -p $HOME/.vim/
fi

if [ ! -L $HOME/.vim/templates ]; then
    ln -s $CONFIG_DIR/dotfile/vim/templates $HOME/.vim/templates
fi

if [ -z "$(git config --get core.excludesfile)" ]; then
git config --global core.excludesfile $CONFIG_DIR/gitignore 
fi

exit 1
