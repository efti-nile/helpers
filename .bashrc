# From https://unix.stackexchange.com/questions/129143/what-is-the-purpose-of-bashrc-and-how-does-it-work
HISTCONTROL=ignoreboth:erasedups HISTSIZE=100000 HISTFILESIZE=200000
ls --color=al > /dev/null 2>&1 && alias ls='ls -F --color=al' || alias ls='ls -G'
md () { [ $# = 1 ] && mkdir -p "$@" && cd "$@" || echo "Error - no directory passed!"; }
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
HOST='\033[02;36m\]\h'; HOST=' '$HOST
TIME='\033[01;31m\]\t \033[01;32m\]'
LOCATION=' \033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
BRANCH=' \033[00;33m\]$(git_branch)\[\033[00m\]\n\$ '
PS1=$TIME$USER$HOST$LOCATION$BRANCH
PS2='\[\033[01;36m\]>'
set -o vi # vi at command line
export EDITOR=vim
test -f ~/.bash_aliases && . $_
test -f ~/.git-completion.bash && . $_
test -s ~/.autojump/etc/profile.d/autojump && . $_
[ ${BASH_VERSINFO[0]} -ge 4 ] && shopt -s autocd
[ -f /etc/bash_completion ] && ! shopt -oq posix && . /etc/bash_completion
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$home/.rvm/scripts/rvm"
