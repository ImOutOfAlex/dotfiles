{ ... }: {
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "x-scheme-handler/jetbrains" = "jetbrains-toolbox.desktop";
        "x-scheme-handler/fleet" = "jetbrains-fleet.desktop";
        "text/plain" = "helix.desktop";
        # "inode/directory" = "joshuto.desktop";  # TODO: Fix with GUI app instead.
        "application/pdf" = "firefox.desktop";
      };
    };
    configFile."i3" = {
      enable = true;
      executable = true;
      recursive = true;
      source = ../i3;
    };
    configFile."i3blocks" = {
      enable = true;
      executable = true;
      recursive = true;
      source = ../i3blocks;
    };
    configFile."conky" = {
      enable = true;
      executable = true;
      recursive = true;
      source = ../conky;
    };
  };
}
