{ config, pkgs, ... }:

{
  home = {
    username = "alex";
    homeDirectory = "/home/alex";
    stateVersion = "22.11";
    sessionVariables.LOCALES_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";

    packages = with pkgs; [
      ripgrep
      dua
      jq
    ];
    file = {
      ".local/bin/s" = {
        executable = true;
        text = ''
#!/usr/bin/env sh

if test $# -eq 1 && test -f $1; then
  bat $1
  exit
fi

lsd -l $@
          '';
      };
    };
  };

  services = {
    # flameshot = {
    #   enable = true;
    #   settings = {
    #     General = {
    #       disabledTrayIcon = false;
    #       showStartupLaunchMessage = false;
    #       useJpgForClipboard = true;
    #     };
    #   };
    # };
  };

  programs = {
    bat.enable = true;
    lsd.enable = true;
    zoxide.enable = true;
    home-manager.enable = true;
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };

    starship = {
      enable = true;
    };

    rofi = {
      enable = true;
      theme = "solarized";
      extraConfig = {
        modi = "combi";
        combi-modi = "window,drun,ssh";
        lines = 30;
        show-icons = true;
      };
    };

    bash = {
      enable = true;

      initExtra = ''
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"

# Rust config
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"


# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ] ; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
'';

      shellAliases = {
        cat = "bat";
        ls = "lsd";
        ll = "lsd -al";
        l = "lsd -l";
        vim = "nvim";
        vi = "nvim";
        v = "nvim";
      };
    };
  };
}
