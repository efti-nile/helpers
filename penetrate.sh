#!/bin/bash

if [[ -z "$(which tmux)" ]] then;
    echo "Consider installing tmux"
fi

if [[ -z "$(which zsh)" ]] then;
    echo "Consider installing zsh"
fi

if [[ -z "$(which vim)" ]] then;
    echo "Consider installing vim"
fi

echo 'Clonning rep with config files'

test ! -d "$HOME/helpers" \
    && git clone https://github.com/efti-nile/helpers.git

echo 'Replacing $HOME/.zshrc with $HOME/helpers/.zshrc'

test -f "$HOME/.zshrc" \
    && mv "$HOME/.zshrc" "$HOME/.zshrc.holdmybear"
     
ln -s "$HOME/helpers/.zshrc"

