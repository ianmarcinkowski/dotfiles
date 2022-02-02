# nvm
export NVM_DIR=~/.nvm
group_lazy_load $HOME/.nvm/nvm.sh nvm node npm

# rvm
# Basic usage: [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# With lazy loading
export PATH="$PATH:$HOME/.rvm/bin"
group_lazy_load $HOME/.rvm/scripts/rvm rvm irb rake rails gem bundle pod
