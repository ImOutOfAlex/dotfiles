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
      usbutils
      file
      # mlocate
      # openssl
      sage
    ];
  };

  programs = {
    ripgrep.enable = true;
    jq.enable = true;
    btop.enable = true;
  };
}
