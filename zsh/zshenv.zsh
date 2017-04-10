#!/usr/bin/zsh

SCRIPT="${HOME}/.zshrc"
SCRIPT=$(readlink -f $SCRIPT)
export DOTFILESDIR=$(dirname $SCRIPT)
