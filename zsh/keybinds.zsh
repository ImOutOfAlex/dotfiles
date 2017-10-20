#!/usr/bin/zsh

bindkey "\e[H" beginning-of-line
bindkey "\e[7~" beginning-of-line

bindkey "\e[F" end-of-line
bindkey "\e[8" end-of-line

bindkey "\e[3~" delete-char

bindkey "\e[2~" quoted-insert

bindkey "\e[1;5C" forward-word

bindkey "\e[1;5D" backward-word

bindkey "^H" backward-delete-word

