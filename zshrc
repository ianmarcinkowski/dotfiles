# Path to your oh-my-zsh configuration.
plugins=(git fzf ssh-agent wd)
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="ianmarcinkowski"
source $ZSH/oh-my-zsh.sh

HISTSIZE=10000
SAVEHIST=10000
unsetopt correct_all

# User configuration
source $HOME/.zsh/path.zsh
source $HOME/.zsh/envvars.zsh
source $HOME/.zsh/aliases.zsh
# source $HOME/.zsh/auto-completion-config.zsh
source $HOME/.zsh/key-bindings.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/dev-environment.zsh
source $HOME/.zsh/framebuffer-colours.zsh
source $HOME/.zsh/fzf-config.zsh
source $HOME/.zsh/brew.zsh

if [ -d "$HOME/.zsh/work" ] && [ "$(ls -A $HOME/.zsh/work)"]; then
    for file in $HOME/.zsh/work/*(.); do
        source "$file"
    done
fi