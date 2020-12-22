#!/bin/bash

set -e

if [ -z "$GIT_HUB_KEY" ]; then
    echo "GIT_HUB_KEY env. variable should contain a path to a private key for Git Hub"
fi

SSH_AGENT=`ps aux | grep ssh-agent`
if [ -z "$SSH_AGENT" ]; then
    eval "$(ssh-agent -s)"
    ssh-add "$GIT_HUB_KEY"
fi
