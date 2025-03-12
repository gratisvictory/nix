{pkgs, ...}: {
  programs.bat = {
    enable = true;
    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "main";
          sha256 = "1glmv225brinkbcf49mzn72hqy6rs2hmcw71shvn6zrgsgzm0rx5";
        };
        file = "catppuccin-mocha.bat-theme";
      };
    };
  };
}
