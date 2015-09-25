#!/bin/sh

DIR=`dirname $0`

mkdir -p $HOME/.vimbackup 2>/dev/null
mkdir -p $HOME/.viminfo 2>/dev/null
mkdir -p $HOME/.vimundo 2>/dev/null
mkdir -p $HOME/tmp 2>/dev/null

ln -s $DIR/.vimrc $HOME/.vimrc
ln -s $DIR/.tmux.conf $HOME/.tmux.conf
ln -s $DIR/.zshrc $HOME/.zshrc
ln -s $DIR/.gitconfig $HOME/.gitconfig
ln -s $DIR/.gitignore_global $HOME/.gitignore_global
