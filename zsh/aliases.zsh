# aliases
alias la='ls -al --color=auto'
alias ls='ls --color=auto'
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
alias grep='grep --color'
alias migrate='migrate.py'
alias tlist='tmux list-sessions'
alias tsession='tmux attach-session -t $1 || tmux new-session -t $2'
alias vimrc='vim $VIMDIR/vimrc'
alias ra='ranger'
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'
alias docker-rmi-all='docker rmi $(docker images -q)'
alias docker-cleanup='docker rm $(docker ps -a -f "name=_run_" -q) && docker rmi $(docker images -q)'
alias dc='docker-compose'
alias vim='nvim'
