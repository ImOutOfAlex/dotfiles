#!/usr/bin/env fish

if functions -q bass
    bass source /etc/profile
    # bass source <(plz --completion_script)
end

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

update-colors-from-x

if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end


# Created by `userpath` on 2020-04-11 03:30:37
set PATH $PATH /home/alex/.local/bin

if not command -sq starship
    sh -c (curl -fsSL https://starship.rs/install.sh)
end

starship init fish | source
