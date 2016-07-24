#!/usr/bin/env bash

CONFIG_DIR=$HOME/.conf
if [ -e $HOME/.bashrc ] then
else
ln -s $CONFIG_DIR/dotfile/bash $HOME/.bashrc
fi

if [ -e $HOME/.vimrc ] then
else
ln -s $CONFIG_DIR/dotfile/vimrc $HOME/.vimrc
fi

if [ -e $HOME/.vim/templates ] then
else
    mkdir -p $HOME/.vim/templates
fi
ln -s $CONFIG_DIR/dotfile/vim/templates $HOME/.vim/templates
