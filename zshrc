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
source $HOME/.zsh/framebuffer-colours.zsh
source $HOME/.zsh/fzf-config.zsh
source $HOME/.zsh/dev-environment.zsh

if [[ "$OSTYPE" == "darwin"* ]] && [ -f "$HOME/.zsh/macos.zsh" ]; then
    source $HOME/.zsh/macos.zsh
elif [[ "$OSTYPE" == "linux-gnu" ]] && [ -f "$HOME/.zsh/linux.zsh" ]; then
    source $HOME/.zsh/linux.zsh
fi

if [ -d "$HOME/.zsh/work" ] && [ "$(ls -A $HOME/.zsh/work)"]; then
    for file in $HOME/.zsh/work/*(.); do
        source "$file"
    done
fi
