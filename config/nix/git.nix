{
  ...
}: {
  programs = {
    git = {
      enable = true;
      lfs = {
        enable = true;
      };
      userEmail = "ImOutOfAlex@her.farm";
      userName = "Alex";
      difftastic = {
        enable = true;
      };
      extraConfig = {
        push.default = "current";
        init.defaultBranch = "main";
      };
      ignores = [
        ".idea"
      ];
    };
  };
}
