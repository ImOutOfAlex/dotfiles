{
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      nodejs_20
      python311
      jetbrains-toolbox
      jetbrains.webstorm
      godot_4
    ];
  };
  programs = {
    mise = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
