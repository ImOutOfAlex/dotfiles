#!/usr/bin/zsh
# TODO: Find a zsh plugin that does this for me...

bindkey -e

bindkey -e "\e[H" beginning-of-line
bindkey -e "\e[7~" beginning-of-line

bindkey -e "\e[F" end-of-line
bindkey -e "\e[8~" end-of-line

bindkey -e "\e[3~" delete-char

bindkey -e "\e[2~" quoted-insert

bindkey -e "\e[1;5C" forward-word

bindkey -e "\e[1;5D" backward-word

bindkey -e "^[[3^" delete-word

bindkey -e "^H" backward-delete-word

