{
  homeDirectory,
  pkgs,
  stateVersion,
  system,
  username,
  ...
}:
let
  cli_packages = with pkgs; [
    lm_sensors
    dua
    stow
    mimic
    nodejs_20
    usbutils
    file
    # python311
    # mlocate
    # openssl
  ];
in {
  home = {
    packages = with pkgs; [
      lm_sensors
      dua
      stow
      mimic
      nodejs_20
      # python311
      usbutils
      file
      # mlocate
      # openssl
      # protontricks
    ];
  };

  programs = {
    ripgrep.enable = true;
    jq.enable = true;
    btop.enable = true;

    # mise = {
    #   enable = true;
    #   enableBashIntegration = true;
    # };
  };
}
