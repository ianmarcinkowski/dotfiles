function up() { local p= i=${1:-1}; while (( i-- )); do p+=../; done; cd "$p$2" && pwd; }

# Docker aliases
function mdk() { docker kill $1; docker rm $1; }
function dockip() { docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@" }
