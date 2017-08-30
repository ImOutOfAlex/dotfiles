#!/usr/bin/zsh

SCRIPT="${HOME}/.zshrc"
SCRIPTLINKED=$(readlink -f $SCRIPT)
SCRIPTDIR=$(dirname $SCRIPTLINKED)
export DOTFILESDIR=$(realpath "${SCRIPTDIR}/..")
export EDITOR=vim
export VISUAL=vim
