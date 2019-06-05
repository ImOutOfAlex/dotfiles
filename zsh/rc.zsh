#!/usr/bin/zsh
# TODO: Replace this with a proper "source" instead of running directly.

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

#Aliases
source "${DOTFILESDIR}/zsh/aliases.zsh"

# ZPlug
source "${DOTFILESDIR}/zsh/zplug_content.zsh"

# Extra
if [ -f "${HOME}/.extra/rc.zsh" ]; then
    source "${HOME}/.extra/rc.zsh"
fi

# TODO: Set this via a config to the plugin.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
