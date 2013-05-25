# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZDOTDIR="${HOME}/zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ianmarcinkowski"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh

# CUSTOM turn autocorrect off
unsetopt correct_all

# Customize to your needs...
#
# aliases
alias la='ls -alG'
alias ls='ls -G'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias back="cd -"
alias blog="bzr log | less"
alias bstat="bzr status"
alias qdiff='bzr qdiff'
alias qlog='bzr qlog'
alias startnginx='sudo /usr/local/nginx/sbin/nginx'
alias stopnginx='sudo kill `cat /usr/local/nginx/logs/nginx.pid `'
alias restartnginx='stopnginx; startnginx'
alias clone='virtualenv-clone'
alias pydevelop='python setup.py develop'
alias pyinstall='python setup.py install'
alias grep='grep --color'
alias psqlplaypen='psql -h playpen.beanfield.com boss_stage'
alias psqlbss='psql -h bssmowat.beanfield.com boss'
alias beandev='cd bean.models && pydevelop && cd ../bean.lib && pydevelop && cd ../bean.iptv && pydevelop && cd ../bean && pydevelop'
alias migrate='migrate.py'
alias bossmux='~/.tmux/boss'
alias tlist='tmux list-sessions'
alias tattach='tmux attach-session -t'
alias tnew='tmux new-session -s'
alias therapist='cd ~/code/splintermind-attributes && sudo ~/code/splintermind-attributes/bin/release/DwarfTherapist'

function myls () { ls -la "$@" }
function up() { local p= i=${1:-1}; while (( i-- )); do p+=../; done; cd "$p$2" && pwd; }

# from bash_profile
export PATH=/usr/local/postgresql-9.1/bin:~/.local/bin:~/code/Python-2.7.3/Tools/i18n:$PATH
export LSCOLORS='cxfxcxdxbxegedabagacad'
export CLICOLOR_FORCE=1
export WORKON_HOME=$HOME/.virtualenvs
source /etc/bash_completion.d/virtualenvwrapper
export GREP_COLOR=1

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
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlight/zsh-syntax-highlighting.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-syntax-highlight/zsh-syntax-highlighting.zsh

  # override some colors:
  ZSH_HIGHLIGHT_STYLES[default]='none'
  ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold,underline'
  ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=green'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta,bold'
  ZSH_HIGHLIGHT_STYLES[function]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[command]='fg=magenta,bold'
  ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=red,bold,standout'
  ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'
  ZSH_HIGHLIGHT_STYLES[globbing]='fg=white,bold'
  ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=red,bold'
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=red'
  ZSH_HIGHLIGHT_STYLES[assign]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=cyan,bold'
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=cyan'

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

