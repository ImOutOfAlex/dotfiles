{
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      # Chat systems
      mumble
      # discord
      # element-desktop

      # UI based editors
      audacity
      # krita
      # blender

      # Video
      # plex-desktop

      # Helpful tools
      qFlipper
    ];
  };

  programs = {
    firefox = {
      # enable = true;
      enable = false;
    };

    mpv = {
      # enable = true;
      enable = false;
    };
  };
}
