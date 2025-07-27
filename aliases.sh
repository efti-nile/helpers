# a comprehensive list of all files (including '.' and '..').
alias ll='ls -ahlF'

# a simple list of all files
alias la='ls -A'

# a columned list of regular files
alias l='ls -CF'

# tmux
alias ta='tmux attach'              # attach last session
alias tls='tmux ls'                 # list sessions
alias tns='tmux new -s'             # new session by name
alias tas='tmux attach-session -t'  # attach session by name
alias tks='tmux kill-session -t'    # kill session by name

# colors for ls, grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# #
# Conda

alias cnd='conda deactivate'
alias cna='conda activate'
alias cnc='conda create --name'
alias cni='conda install'
alias cnie='conda info --envs'
alias cnl='conda list'
alias cnerm='conda env remove -n'


# #
# Git

alias gs='git status'

# configuration
alias g_store_creds='git config credential.helper store'  # git store credential

# work with files
alias ga='git add'
alias gaa='git add -A'
alias grm='git rm'
alias gr='git restore'
alias gmv='git mv'

# work with commits
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a --amend -m'
alias gd='git diff'
alias gm='git merge'
g_short_commit () {
  git add -A
  git commit -m "$1"
  git push
}
alias g_minor='g_short_commit "minor"'
alias g_bugfix='g_short_commit "bugfix"'
alias g_cleanup='g_short_commit "clean up"'

# work with remotes
alias gar='git add remote'
alias grv='git remote -v'
alias gph='git push'
alias gpl='git pull'
alias gf='git fetch'

# work with branches
alias gcb='git checkout -b'  # new branch
alias gb='git branch -a'     # list remote and local branches
alias gch='git checkout'

# work with repos
alias gcl='git clone'


# #
# Docker

# system-wide
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.CreatedAt}}\t{{.Ports}}"'
alias dsdf='docker system df'
alias dsp='docker system prune -a --volumes'

# application-wide
alias dcu='docker compose up -d'
alias dcub='docker compose up --build -d'
alias dcd='docker compose down'

# container-wide
alias ds='docker stats'
alias dl='docker logs -f --tail 100'
# execute bash in container:
desh () {
    local container="$1"
    docker exec -it "$container" bash
}
# execute bash in image:
drsh () {
    local image="$1"
    docker run -it "$image" bash
}
# run sticky log:
dls () {
    local container="$1"
    while true; do
        docker logs -f --tail 100 "$container"
        echo "Container $container stopped. Reconnecting to logs..."
        sleep 5
    done
}


# #
# Files

# Function to unpack each *.tar.gz into a new folder with the same name
untargz_all() {
  for file in *.tar.gz; do
    folder="${file%.tar.gz}"      # Remove the .tar.gz extension to get the folder name
    mkdir -p "$folder"            # Create the folder
    tar -xzf "$file" -C "$folder" # Extract the archive into the folder
  done
}

# Function to count files in folders, outputs result as "{path}: {files_count}"
count_files_in_folders() {
  for folder in */; do
    count=$(find "$folder" -type f | wc -l)
    echo "$folder: $count files"
  done
}
