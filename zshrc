# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ianmarcinkowski"
plugins=(git ssh-agent fzf-zsh-plugin wd)
source $ZSH/oh-my-zsh.sh

# User configuration
source $HOME/.zsh/path.zsh
source $HOME/.zsh/envvars.zsh
source $HOME/.zsh/aliases.zsh
# source $HOME/.zsh/auto-completion-config.zsh
source $HOME/.zsh/fzf-config.zsh
source $HOME/.zsh/key-bindings.zsh
source $HOME/.zsh/functions.zsh

unsetopt correct_all

# Docker commands
# framebuffer colors:
if [[ ${TERM} == linux ]] || [[ ${TERM} =~ screen && ${+DISPLAY} == 0 ]]; then
    echo -en "\e]P0000000" ; echo -en "\e]P83d3a3a"
    echo -en "\e]P1d74b73" ; echo -en "\e]P9e07895"
    echo -en "\e]P2799c99" ; echo -en "\e]PA85afa9"
    echo -en "\e]P3c8bc45" ; echo -en "\e]PBbaa02c"
    echo -en "\e]P476ace2" ; echo -en "\e]PC98a7b6"
    echo -en "\e]P5a488d9" ; echo -en "\e]PD9f8bab"
    echo -en "\e]P6508686" ; echo -en "\e]PE569e9a"
    echo -en "\e]P78d8d8d" ; echo -en "\e]PFdad3d3"
fi

HISTSIZE=10000
SAVEHIST=10000