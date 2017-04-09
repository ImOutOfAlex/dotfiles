#!/usr/bin/zsh

SCRIPT="${HOME}/.zshrc"
SCRIPT=$(readlink -f $SCRIPT)
BASEDIR=$(dirname $SCRIPT)

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
source "${BASEDIR}/aliases.zsh"

#Key Bindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[2~" quoted-insert
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^_" backward-delete-word

#Themes
THEMEDIR="${BASEDIR}/themes"
eval `dircolors --sh "${THEMEDIR}/solarized/dircolors/dircolors.ansi-dark"`
# source "${THEMEDIR}/solarized/mintty/sol.dark"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#Completions
setopt append_history share_history histignorealldups
setopt prompt_subst
setopt autocd
setopt completeinword
setopt correct
setopt list_ambiguous
setopt completealiases
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

#ZPlug
source "${BASEDIR}/zplug_content.zsh"

#Prompt
source "${BASEDIR}/prompt.zsh"

