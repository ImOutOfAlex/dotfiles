#!usr/bin/env bash

# Make sure this is before the 'exec' command or it won't be sourced.
if [ -f /etc/xprofile ] ; then
    . /etc/xprofile
fi
if [ -f ~/.xprofile ] ; then
    . ~/.xprofile
fi

exec /usr/bin/lxpolkit --no-startup-id &

eval `cat ~/.fehbg`

exec i3
