#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm"

if ! [ -f $NVM_DIR/nvm.sh ]; then
  curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
