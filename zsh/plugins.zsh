#!/usr/bin/zsh

zplug 'zplug/zplug', \
    hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-autosuggestions"
zplug "Tarrasch/zsh-autoenv"
zplug "zsh-users/zsh-syntax-highlighting"

if [ -f "${HOME}/.extra/plugins.zsh" ]; then
    source "${HOME}/.extra/plugins.zsh"
fi
zplug "joel-porquet/zsh-dircolors-solarized", \
    hook-build:"setupsolarized dircolors.ansi-dark"
