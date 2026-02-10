#!/bin/sh

# Directories E.g.
# if [ ! -e ~/.local/bin ]
# then
#     mkdir -p ~/.local/bin
# fi

# Link configuration files, continue on failure
ln -s "$PWD/tmux.conf" ~/.tmux.conf || echo "Failed to link tmux.conf to ~/.tmux.conf"
ln -s "$PWD/zsh" ~/.zsh || echo "Failed to link zsh to ~/.zsh"
ln -s "$PWD/zshrc" ~/.zshrc || echo "Failed to link zshrc to ~/.zshrc"
ln -s "$PWD/vim" ~/.vim || echo "Failed to link vim to ~/.vim"
ln -s "$PWD/neovim/init.lua" ~/.config/nvim/init.lua || echo "Failed to link neovim init.lua to ~/.config/nvim/init.lua"
ln -s "$PWD/neovim/lua" ~/.config/nvim/lua || echo "Failed to link neovim lua to ~/.config/nvim/lua"

cp -r oh-my-zsh/custom/* ~/.oh-my-zsh/custom/

# TODO
# fzf, fdfind, silversearcher

echo "Install fzf, fdfind, silversearcher-ag"
