alias dcud='docker compose up -d'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dvl='docker volume list'
alias dnl='docker network ls'

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/svo/.docker/completions $fpath)
autoload -Uz compinit
compinit