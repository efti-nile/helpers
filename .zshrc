# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source "$HOME/helpers/aliases.sh"
source "$HOME/helpers/ssh_agent.sh"

export EDITOR="$(which vim)"

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# I like `pure` prompt. So install it
if [[ -d "$HOME/.zshrc/pure" ]]; then
    if [[ ! -d "$HOME/.zshrc" ]]; then
        mkdir -p "$HOME/.zshrc"
    fi
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

# and enable
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# use less exotic symbols
export PURE_PROMPT_SYMBOL='>'
export PURE_PROMPT_VICMD_SYMBO='<'
export PURE_GIT_DOWN_ARROW='↓'
export PURE_GIT_UP_ARROW='↑'
export PURE_GIT_STASH_SYMBOL='='

