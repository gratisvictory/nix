{...}: {
  programs.bat = {
    enable = true;

    config = {
      theme = "Dracula";
      italic-text = "always";
      style = "numbers,changes,header,grid";
      pager = "less -FR";
      map-syntax = [
        "*.conf:INI"
        "*.prop:INI"
        "*.nix:Nix"
        "*.nu:Shell"
        "PKGBUILD:Shell"
        "*.dockerfile:Docker"
        "*.ipynb:JSON"
      ];
    };
  };
}
