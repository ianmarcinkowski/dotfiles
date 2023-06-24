#!/bin/sh

# Directories E.g.
# if [ ! -e ~/.local/bin ]
# then
#     mkdir -p ~/.local/bin
# fi

ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/zsh ~/.zsh
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/vim ~/.vim

if [ ! -e ~/.oh-my-zsh/custom/themes ]
then
    mkdir -p ~/.oh-my-zsh/custom/themes
fi

cp oh-my-zsh/ianmarcinkowski.zsh-theme ~/.oh-my-zsh/custom/themes/

# TODO
# fzf, fdfind, silversearcher