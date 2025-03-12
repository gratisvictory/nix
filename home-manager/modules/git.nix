{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "gratisvictory";
    userEmail = "alex.borzov@proton.me";
    extraConfig = {
      core = {
        editor = "code --wait";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
      delta = {
        enable = true;
        options = {
          line-numbers = true;
          side-by-side = true;
          navigate = true;
        };
      };
    };
  };
}
