{ config, pkgs, ... }:

let
  is_nixos = true;
  email = "ImOutOfAlex@her.farm";
  git_user_name = "Alex";
in {
  home = {
    username = "alex";
    homeDirectory = "/home/alex";
    stateVersion = "22.11";
    sessionVariables.LOCALES_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";

    packages = with pkgs; [
      # CLI Apps
      lm_sensors
      dua
      jq
      stow
      mimic
      dtrx
      nodejs_20
      python311
      mlocate
      usbutils
      file
      p7zip

      # UI Apps
      fm
      krita
      element-desktop
      jstest-gtk
      plex-media-player
      arandr
      blender
      audacity
      prismlauncher
      libsForQt5.spectacle
      keepassxc
      discord
      pavucontrol
      jetbrains-toolbox
      jetbrains.webstorm
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

  xdg.mimeApps = {
    enable = is_nixos;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
      "x-scheme-handler/jetbrains" = "jetbrains-toolbox.desktop";
      "x-scheme-handler/fleet" = "jetbrains-fleet.desktop";
      "text/plain" = "vim.desktop";
      "inode/directory" = "ranger.desktop";
      "application/pdf" = "firefox.desktop";
    };
  };

  services = {
    dunst = {
      enable = is_nixos;
    };
  };

  programs = {
    home-manager.enable = true;
    bat.enable = true;
    lsd.enable = true;
    ripgrep.enable = true;
    jq.enable = true;
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[➜](bold green) ";
          error_symbol = "[✗](bold red) ";
        };
        directory = {
          truncation_length = 1;
          fish_style_pwd_dir_length = 1;
          read_only = " ";
        };
        aws = { symbol = "  "; };
        conda = { symbol = " "; };
        dart = { symbol = " "; };
        docker_context = { symbol = " "; };
        elixir = { symbol = " "; };
        elm = { symbol = " "; };
        git_branch = { symbol = " "; };
        golang = { symbol = " "; };
        hg_branch = { symbol = " "; };
        java = { symbol = " "; };
        julia = { symbol = " "; };
        memory_usage = { symbol = " "; };
        nim = { symbol = " "; };
        nix_shell = { symbol = " "; };
        package = { symbol = " "; };
        perl = { symbol = " "; };
        php = { symbol = " "; };
        python = { symbol = " "; };
        ruby = { symbol = " "; };
        rust = { symbol = " "; };
        scala = { symbol = " "; };
        shlvl = { symbol = " "; };
        swift = { symbol = "ﯣ "; };
      };
    };

    git = {
      enable = true;
      lfs = {
        enable = true;
      };
      userEmail = email;
      userName = git_user_name;
      difftastic = {
        enable = true;
      };
      extraConfig = {
        push.default = "current";
        init.defaultBranch = "main";
      };
    };

    rtx = {
      enable = true;
      enableBashIntegration = true;
    };

    bash = {
      enable = true;

      initExtra = ''
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"

# nix stuff
export NIXPKGS_ALLOW_UNFREE=1

# Jetbrains
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"

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
        v = "hx";
        vi = "hx";
        vim = "hx";
      };
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
    };

    helix = {
      enable = true;
      settings = {
        theme = "base16_default_dark";
      };
    };

    firefox.enable = is_nixos;

    mpv = {
      enable = is_nixos;
    };
    
    alacritty = {
      enable = is_nixos;
      settings = {
        font = {
          normal.family = "JetBrainsMono Nerd Font";
          bold.family = "JetBrainsMono Nerd Font";
          italic.family = "JetBrainsMono Nerd Font";
        };
      };
    };

    rofi = {
      enable = is_nixos;
      theme = "solarized";
      extraConfig = {
        modi = "combi";
        combi-modi = "window,drun,ssh";
        lines = 30;
        show-icons = true;
      };
    };
  };
}
