#!/bin/sh

# Directories
if [ ! -e ~/.local/bin ]
then
    mkdir -p ~/.local/bin
fi

if [ ! -e ~/.run ]
then
    mkdir -p ~/.run
fi

if [ ! -e ~/.vim ]
then
    mkdir -p ~/.vim
fi

if [ ! -e ~/.zsh ]
then
    mkdir -p ~/.zsh
fi

# Grap repos
if [ ! -e ~/code/hg-prompt/prompt.py ]
then
    cd ~/code
    hg clone https://bitbucket.org/sjl/hg-prompt
fi

if [ ! -e ~/.oh-my-zsh ]
then
    cd ~
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
cp oh-my-zsh/ianmarcinkowski.zsh-theme ~/.oh-my-zsh/themes/
cp local-bin/* ~/.local/bin/
cp -r vim/* ~/.vim/
cp -r zsh/* ~/.zsh/
cp git/gitignore ~/.gitignore
cp hgrc ~/.hgrc
