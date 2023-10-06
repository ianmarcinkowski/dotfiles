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

cp -r oh-my-zsh/custom/* ~/.oh-my-zsh/custom/

# TODO
# fzf, fdfind, silversearcher
echo "Install fzf, fdfind, silversearcher-ag"
