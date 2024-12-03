{
  config,
  homeDirectory,
  pkgs,
  stateVersion,
  system,
  username,
  ...
}: {
  home = {
    sessionVariables = {
      LOCALES_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
    };
    enableNixpkgsReleaseCheck = false;
  };

  manual.manpages.enable = false;

  programs.home-manager.enable = true;
}
