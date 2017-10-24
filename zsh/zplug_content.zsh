#!/usr/bin/zsh

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Add a bunch more of your favorite packages!
source "${DOTFILESDIR}/zsh/plugins.zsh"
if [ -f "${HOME}/.extra/zsh_plugins" ]; then
    source "${HOME}/.zsh_plugins"
fi

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load
