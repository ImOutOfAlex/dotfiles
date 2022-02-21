HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
if [ $SHELL == "/bin/bash" ]
then
  # TODO: Handle this more elegantly one day
  shopt -s histappend
fi

