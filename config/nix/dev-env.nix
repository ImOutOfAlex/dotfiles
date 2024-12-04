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
    file.".config/environment.d/jb_toolbox.conf" = {
      text = "PATH=\"\$PATH:\$HOME/.local/share/JetBrains/Toolbox/scripts\"";
    };
  };
  programs = {
    mise = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
