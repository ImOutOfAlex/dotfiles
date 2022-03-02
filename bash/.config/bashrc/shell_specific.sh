#!/usr/bin/env bash

# TODO: Handle this more elegantly one day.
if [ $SHELL = "/bin/bash" ]
then
  export LESS='--mouse --wheel-lines=3 --RAW-CONTROL-CHARS'
  shopt -s checkwinsize
  shopt -s autocd
  shopt -s histappend
fi

