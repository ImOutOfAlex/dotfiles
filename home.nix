{
  homeDirectory,
  stateVersion,
  username,
  ...
}: {
  imports = [
    config/nix/common.nix
    config/nix/gui.nix
    config/nix/cui.nix
    config/nix/cli_tools.nix
    config/nix/git.nix
    config/nix/services.nix
  ];

  home = {
    inherit stateVersion homeDirectory username;
  };
}
