#!/bin/bash

smartlink () {
    LINK_DEST=$1
    LINK_SRC=$2
    if [ -e "${LINK_DEST}" ]; then
        rm -rf "${LINK_DEST}"
    fi
    ln -s "${LINK_SRC}" "${LINK_DEST}"
}

SCRIPT=$(readlink -f $0)
BASEDIR=`dirname $SCRIPT`

smartlink "${HOME}/.zshrc"       "${BASEDIR}/zshrc"
smartlink "${HOME}/.tmux.conf"   "${BASEDIR}/tmux.conf"
smartlink "${HOME}/.vimrc"       "${BASEDIR}/vimrc"
smartlink "${HOME}/.i3"          "${BASEDIR}/i3"
smartlink "${HOME}/.xinitrc"     "${BASEDIR}/xinitrc"

git clone https://github.com/mavnn/mintty-colors-solarized.git "${BASEDIR}/themes/solarized/mintty"
git clone https://github.com/solarized/xresources.git "${BASEDIR}/themes/solarized/xresources"
git clone https://github.com/seebi/dircolors-solarized.git "${BASEDIR}/themes/solarized/dircolors"

chsh -s /bin/zsh
