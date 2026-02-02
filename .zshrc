export SHELL='/bin/zsh'

# locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# #
# Completion

# init the completion system
autoload -Uz compinit
compinit

# disables the use of the old completion system (compctl)
zstyle ':completion:*' use-compctl false

# configure the completion system
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# set the colors for completions
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''

# `kill` completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# #
# Prompt

if command -v starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
else
  autoload -Uz promptinit
  promptinit
  prompt adam1
fi


# #
# Aliases

if [ -f ~/aliases.sh ]; then
  source ~/aliases.sh
fi


# #
# History

export HISTSIZE=500000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
# don't save duplicates in the history:
setopt histignorealldups
# share history between zsh terminals:
setopt sharehistory
# enable reverse search with Ctrl + R:
bindkey '^R' history-incremental-search-backward


# #
# VIM

bindkey -v
export EDITOR='vim'
export GIT_EDITOR='vim'


# changing directory without `cd`:
setopt autocd
