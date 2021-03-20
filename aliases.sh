alias ga='git add'
alias gaa='git add *'
alias gar='git add remote'
alias gb='git branch -a'  # list remote and local branches
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcb='git checkout -b'  # new branch
alias gch='git checkout'
alias gch='git checkout'
alias gd='git diff'
alias gdnc='git add *; git commit -m "Dummy Message"'  # git do not care
alias gm='git merge'
alias gmv='git mv'
alias gph='git push'
alias gpl='git pull'
alias gr='git restore'
alias grm='git rm'
alias grv='git remote -v'
alias gs='git status'
alias gsc='git config credential.helper store'  # git store credential

alias git_minor='git pull && git add -A && git commit -m minor && git push'
alias git_bugfix='git pull && git add -A && git commit -m bugfix && git push'

# creates file near original one
iconv_try () {
    iconv -f $2 -t $3 -o "$1.$3" $1
}

# For bash
alias br='. ~/.bashrc'    # bash read
alias be='vim ~/.bashrc'  # bash edit

# For zsh
alias zr='. ~/.zshrc'
alias ze='vim ~/.zshrc'

# For tmux
alias ta='tmux attach'  # attach sessin by name
alias tns='tmux new -s'  # create new session with given name
alias tas='tmux attach-session -t'  # attach sessin by name
alias tkl='tmux kill-session -t'  # kill session by name
alias tls='tmux ls'  # list sessions

