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
    # config/nix/dunst.nix
    # config/nix/dev-env.nix
    config/nix/games.nix
    config/nix/ssh-agent.nix
  ];

  home = {
    inherit stateVersion homeDirectory username;
  };
}
