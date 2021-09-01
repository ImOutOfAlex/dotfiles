#!/usr/bin/env bash

if [ -z $@ ]; then
    i3-msg -t get_workspaces | jq --unbuffered '.[].name' 
else
    echo "TEST"
fi
