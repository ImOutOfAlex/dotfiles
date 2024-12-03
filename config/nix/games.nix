{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    jstest-gtk
    dolphin-emu
    qjoypad
    jdk21
    starsector
    # xivlauncher
    jdk21
    prismlauncher
  ];
}
