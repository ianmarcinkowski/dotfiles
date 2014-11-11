#!/bin/sh

cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
cp oh-my-zsh/ianmarcinkowski.zsh-theme ~/.oh-my-zsh/themes/
mkdir -p ~/.local/bin
cp local-bin/* ~/.local/bin/
cp -r vim ~/.vim
cp -r zsh ~/.zsh
cp git/gitignore ~/.gitignore
cp hgrc ~/.hgrc
