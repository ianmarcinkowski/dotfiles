# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ianmarcinkowski"
plugins=(git fzf ssh-agent wd rbenv asdf)
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

for file in ~/$HOME/.zsh/work/*; do
    source "$file"
done
