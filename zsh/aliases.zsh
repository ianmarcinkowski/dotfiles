# aliases
alias la='ls -al --color=auto'
alias ls='ls --color=auto'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias back="cd -"
alias tlist='tmux list-sessions'
alias tsession='tmux attach-session -t $1 || tmux new-session -t $2'
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'
alias docker-rmi-all='docker rmi $(docker images -q)'
alias docker-cleanup='docker rm $(docker ps -a -f "name=_run_" -q) && docker rmi $(docker images -q)'
alias dc='docker-compose'
alias vim='nvim'
alias open='xdg-open'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\--wip--" && git reset HEAD~1'
alias gcdev='gcloud --project=pwademo-40086'
alias gcprod='gcloud --project=platform-199617'
