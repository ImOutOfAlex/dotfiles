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
    config/nix/services.nix
  ];

  home = {
    inherit stateVersion homeDirectory username;
  };
}
