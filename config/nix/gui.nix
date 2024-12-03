{
  homeDirectory,
  pkgs,
  stateVersion,
  system,
  username,
  ...
}:
let
  is_nixos = true;
in {
  home = {
    packages = [
      pkgs.fm
      pkgs.mumble
      pkgs.arandr
      pkgs.audacity
      pkgs.keepassxc
      pkgs.pavucontrol
      pkgs.sweet
      pkgs.dconf
      pkgs.sxiv
      pkgs.qjoypad
      pkgs.qFlipper
      pkgs.plover.dev
      # pkgs.krita
      # pkgs.plex-desktop
      # pkgs.blender
      # pkgs.libsForQt5.spectacle
      # pkgs.discord
      # pkgs.jetbrains-toolbox
      # pkgs.jetbrains.webstorm
      # pkgs.element-desktop
      # pkgs.godot_4
    ];
  };

  gtk = {
    enable = is_nixos;
    theme = {
      name = "Sweet-Dark";
      package = pkgs.sweet;
    };
  };

  programs = {
    firefox = {
      # enable = is_nixos;
      enable = false;
    };

    mpv = {
      # enable = is_nixos;
      enable = false;
    };
    
    alacritty = {
      # enable = is_nixos;
      enable = false;
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
      terminal = "alacritty";
      extraConfig = {
        modi = "combi";
        combi-modi = "window,drun,ssh";
        lines = 30;
        show-icons = true;
      };
    };
  };
}
