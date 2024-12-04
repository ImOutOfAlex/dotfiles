{
  pkgs,
  ...
}: {
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
