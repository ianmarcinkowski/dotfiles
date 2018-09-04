plugins=(git ssh-agent wd vi-mode nulogy richard docker-osx)
export RAILS_FOOTNOTES_EDITOR=vim
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES # OSX fork thing
export PATH="/usr/local/opt/gettext/bin:$PATH"

eval "$(direnv hook zsh)"
