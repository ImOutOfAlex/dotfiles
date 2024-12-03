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
  imports = [
    config/nix/common.nix
    config/nix/gui.nix
    config/nix/cli.nix
    config/nix/git.nix
  ];

  home = {
    inherit stateVersion homeDirectory username;
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
      "text/plain" = "helix.desktop";
      # "inode/directory" = "joshuto.desktop";  # TODO: Fix with GUI app instead.
      "application/pdf" = "firefox.desktop";
    };
  };

  services = {
    dunst = {
      # enable = is_nixos;
      enable = false;
    };
  };
}
