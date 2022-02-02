# Lazy load all the commands for rvm and nvm (rvm irb rake rails gem bundle pod) (nvm node npm)
# Yoinked from https://gist.github.com/QinMing/364774610afc0e06cc223b467abe83c0
lazy_load() {
    echo "Lazy loading $1 ..."
    local -a names
    if [[ -n "$ZSH_VERSION" ]]; then
        names=("${(@s: :)${1}}")
    else
        names=($1)
    fi
    unalias "${names[@]}"
    . $2
    shift 2
    $*
}

group_lazy_load() {
    local script
    script=$1
    shift 1
    for cmd in "$@"; do
        alias $cmd="lazy_load \"$*\" $script $cmd"
    done
}


