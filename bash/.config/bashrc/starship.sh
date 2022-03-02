#!/usr/bin/env bash


if [ $SHELL = "/bin/bash" ]
then
  eval "$(starship init bash)"
elif [ $SHELL = "/bin/zsh" ]
then
  eval "$(starship init zsh)"
fi

