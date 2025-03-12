{
  programs.eza = {
    enable = true;
    enableNushellIntegration = true;
    colors = "always";
    git = true;
    icons = "always";
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };
}
