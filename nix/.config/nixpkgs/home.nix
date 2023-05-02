{ config, pkgs, ... }:

{
  home = {
    username = "alex";
    homeDirectory = "/home/alex";
    stateVersion = "22.11";

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
      };
    };

    bash = {
      enable = true;

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
