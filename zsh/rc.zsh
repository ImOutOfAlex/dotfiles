#!/usr/bin/zsh
# TODO: Replace this with a proper "source" instead of running directly.
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

#ZSH Modules
autoload -U compinit promptinit zcalc zsh-mime-setup colors
autoload run-help
compinit
promptinit
zsh-mime-setup
colors

#Aliases
source "${DOTFILESDIR}/zsh/aliases.zsh"

#Key Bindings
source "${DOTFILESDIR}/zsh/keybinds.zsh"

# DirColors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Options
setopt append_history share_history histignorealldups
setopt prompt_subst
setopt autocd
setopt completeinword
setopt correct
setopt list_ambiguous
setopt completealiases

# Completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

# ZPlug
source "${DOTFILESDIR}/zsh/zplug_content.zsh"

# Dircolors
eval `dircolors ${ZPLUG_HOME}/repos/seebi/dircolors-solarized/dircolors.256dark`

# Prompt
source "${DOTFILESDIR}/zsh/prompt.zsh"

# Extra
if [ -f "${HOME}/.extra/rc.zsh" ]; then
    source "${HOME}/.extra/rc.zsh"
fi
