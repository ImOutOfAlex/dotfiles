{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Chat systems
    # mumble
    # discord
    # element-desktop

    # UI based editors
    # audacity
    # krita
    # blender

    # Video
    # plex-desktop
    # mpv

    # Helpful tools
    # qFlipper
    # firefox
  ];
}
