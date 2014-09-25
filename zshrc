# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZDOTDIR="${HOME}/zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ianmarcinkowski"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial)

source $ZSH/oh-my-zsh.sh

# CUSTOM turn autocorrect off
unsetopt correct_all

# Customize to your needs...
#
# aliases
alias la='ls -al'
alias ..="cd .."
alias clone='virtualenv-clone'
alias pydevelop='pip install -e .'
alias pyinstall='pip install .'
alias grep='grep --color'
alias beandev='cd bean.models && pydevelop && cd ../bean.lib && pydevelop && cd ../bean && pydevelop'
alias tlist='tmux list-sessions'
alias removebuild='~/.local/bin/removebuilddirs.sh'
alias netisip='finddeviceip.sh 10.219.45.254 8:10'
alias zhoneip='finddeviceip.sh 10.219.45.254 93:40'

# Use infratools' fabfile.py
alias infratools="fab -f $HOME/infratools/mainline/fabfile.py"
# Copy database from staging.beanfield.com/boss_template to localhost/boss_template
alias refresh_boss_template="infratools db.copy_database:from_host=staging.beanfield.com,from_name=boss_template,to_host=localhost,to_name=boss_template"
# Copy database from localhost/boss_template to localhost/boss_dev
alias refresh_boss_dev="infratools db.copy_database:from_host=localhost,from_name=boss_template,to_host=localhost,to_name=boss_dev"
# Copy database from staging.beanfield.com/boss_template and migrate localhost/boss_dev
alias refresh_boss_both="refresh_boss_template && refresh_boss_dev && infratools db.migrate"

function up() { local p= i=${1:-1}; while (( i-- )); do p+=../; done; cd "$p$2" && pwd; }

# from bash_profile
export PATH=~/.local/bin:~/code/Python-2.7.3/Tools/i18n:$PATH
export LSCOLORS='cxfxcxdxbxegedabagacad'
export CLICOLOR_FORCE=1
export WORKON_HOME=$HOME/.virtualenvs
source /etc/bash_completion.d/virtualenvwrapper
export GREP_COLOR=1
export PAGER=less
export PATH=/opt/android-sdk/sdk/platform-tools:$PATH

# If no SSH agent is already running, start one now. Re-use sockets so we never
# have to start more than one session.
export SSH_AUTH_SOCK=$HOME/.run/.ssh-auth-socket
ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
   # No ssh-agent running
   rm -rf $SSH_AUTH_SOCK
   # >| allows output redirection to over-write files if no clobber is set
   ssh-agent -t 36000 -a $SSH_AUTH_SOCK >| /tmp/.ssh-script
   source /tmp/.ssh-script
   echo $SSH_AGENT_PID >| $HOME/.run/.ssh-agent-pid
   rm /tmp/.ssh-script
fi

# auto-completion:
autoload -U compinit
compinit
_force_rehash() { (( CURRENT == 1 )) && rehash ; return 1 }
zstyle ':completion:::::' completer _force_rehash _expand _complete _approximate 
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' verbose true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${XDG_CACHE_HOME:-${HOME}/cache}
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' command 'ps haxopid:5,user:4,%cpu:4,ni:2,stat:3,etime:8,args'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' force-list always
[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman

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

# Fish-like syntax highlighting for ZSH:
if [[ -f $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  . $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

  ZSH_HIGHLIGHT_STYLES[default]=none
  ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
  ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green
  ZSH_HIGHLIGHT_STYLES[alias]=none
  ZSH_HIGHLIGHT_STYLES[builtin]=none
  ZSH_HIGHLIGHT_STYLES[function]=none
  ZSH_HIGHLIGHT_STYLES[command]=none
  ZSH_HIGHLIGHT_STYLES[precommand]=none
  ZSH_HIGHLIGHT_STYLES[commandseparator]=none
  ZSH_HIGHLIGHT_STYLES[hashed-command]=none
  ZSH_HIGHLIGHT_STYLES[path]=none
  ZSH_HIGHLIGHT_STYLES[globbing]=none
  ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
  ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
  ZSH_HIGHLIGHT_STYLES[assign]=none

  # override colors for matching brackets:
  ZSH_HIGHLIGHT_MATCHING_BRACKETS_STYLES=(
    'fg=blue,bold'    # Style for first level of imbrication
    'fg=green,bold'   # Style for second level of imbrication
    'fg=magenta,bold' # etc... Put as many styles as you wish, or leave
    'fg=cyan,bold'    # empty to disable brackets matching.
    'fg=white,bold'
    'fg=blue'
    'fg=green'
    'fg=magenta'
    'fg=cyan'
    'fg=white'
  )
fi

# Fish-like history sub-string search for ZSH (load AFTER syntax):
if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/history-substring-search.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-history-substring-search/history-substring-search.zsh

  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=blue,fg=black,bold'
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=black'
  HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'
fi

# keybindings (defined AFTER scripts):
bindkey "^[[2~" overwrite-mode
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-search 
bindkey "^[[6~" down-line-or-search 
bindkey "^[[1~" beginning-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[8~" end-of-line
bindkey "^?" backward-delete-char
bindkey '^R' history-incremental-search-backward

HISTSIZE=10000
SAVEHIST=10000

