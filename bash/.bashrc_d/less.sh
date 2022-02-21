if [ $SHELL == "/bin/bash" ]
then
  # TODO: Handle this more elegantly one day.
  export LESS='--mouse --wheel-lines=3 --RAW-CONTROL-CHARS'
fi
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
