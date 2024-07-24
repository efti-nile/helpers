# a comprehensive list of all files (including '.' and '..').
alias ll='ls -alF'

# a simple list of all files
alias la='ls -A'

# a columned list of regular files
alias l='ls -CF'

# tmux
alias ta='tmux attach'  # attach sessin by name
alias tns='tmux new -s'  # create new session with given name
alias tas='tmux attach-session -t'  # attach sessin by name
alias tks='tmux kill-session -t'  # kill session by name
alias tls='tmux ls'  # list sessions

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
alias cnle='conda info --envs'
alias cnlp='conda list'
alias cnrm='conda env remove -n'


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
alias gca='git commit --amend'
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

# work with branches
alias gcb='git checkout -b'  # new branch
alias gb='git branch -a'  # list remote and local branches
alias gch='git checkout'

# work with repos
alias gcl='git clone'
