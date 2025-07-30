{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    jstest-gtk
    dolphin-emu
    qjoypad
    starsector
    # xivlauncher
    # jdk21
    # prismlauncher
    # protontricks
  ];
}
