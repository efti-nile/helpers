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
# History & Recursive search

# --- Storage Limits & File Paths ---
export HISTFILE="$HOME/.history"
export HISTSIZE=500000
export SAVEHIST=$HISTSIZE

# --- Filtering & Cleanliness ---
setopt hist_ignore_space       # Do not record lines beginning with a space
setopt hist_ignore_all_dups    # Remove older duplicates when a new duplicate is run
setopt hist_save_no_dups       # Do not write duplicate lines into ~/.history
setopt hist_find_no_dups       # Skip duplicates when searching through history
setopt hist_reduce_blanks      # Strip extra trailing and internal whitespace

# --- Multi-Session Sharing & Immediate Persistence ---
setopt share_history           # Share command history live across all open terminals
setopt inc_append_history      # Write commands to ~/.history as soon as they are executed

# --- Safety & Verification ---
setopt hist_verify             # Show recalled command for editing before running it
setopt hist_expire_dups_first  # Purge duplicate entries first when HISTSIZE is reached

# --- Keybindings & Recursive Pattern Search (Ctrl + R / Ctrl + S) ---
# Backward & forward incremental pattern search
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# Vi-mode compatibility (ensures Ctrl+R/S work in Vi Command Mode)
bindkey -M vicmd '^R' history-incremental-pattern-search-backward
bindkey -M vicmd '^S' history-incremental-pattern-search-forward


# #
# VIM

bindkey -v
export EDITOR='vim'
export GIT_EDITOR='vim'


# changing directory without `cd`:
setopt autocd

# enable extended globbing (advanced wildcard matching):
setopt EXTENDED_GLOB

# enable comments in interactive shells (to paste code with comments)
setopt INTERACTIVE_COMMENTS


# #
# Update Guake / terminal tab title with current command
autoload -Uz add-zsh-hook

function precmd() {
    print -Pn "\e]0;%~\a"
}

function preexec() {
    print -Pn "\e]0;$1\a"
}


# #
# Use fancy `batcat` if installed

if command -v batcat &> /dev/null; then
    alias cat='batcat'
else
    alias cat='/bin/cat'
fi


# #
# Use fancy `btop` if installed

if command -v btop &> /dev/null; then
    alias htop='btop'
fi
