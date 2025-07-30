{
  config,
  pkgs,
  ...
}:
let
in {
  home = {
    packages = with pkgs; [
      # Managers
      fm
      keepassxc
      pavucontrol
      dconf

      # GTK
      sweet

      # Other Theme
      cyberpunk-neon

      # Helpful tools
      sxiv
      # libsForQt5.spectacle
    ];
  };

  gtk = {
    enable = true;
    theme = {
      name = "Sweet-Dark";
      package = pkgs.sweet;
    };
  };

  programs = {
    alacritty = {
      # enable = true;
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
      enable = true;
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
