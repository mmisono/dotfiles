#!/bin/sh

mkdir -p ~/.vimbackup
mkdir -p ~/.viminfo
mkdir -p ~/.vimundo
mkdir -p ~/tmp

ln -s .vimrc ~/.vimrc
ln -s .tmux.conf ~/.tmux.conf
ln -s .zshrc ~/.zshrc
ln -s .gitconfig ~/.gitconfig
ln -s .gitignore_global ~/.gitignore_global
