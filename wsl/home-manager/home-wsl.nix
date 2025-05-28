{
  pkgs,
  stateVersion,
  username,
  ...
}: {
  imports = [
    ./modules
    ./home-packages-wsl.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };

  programs = {
    direnv = {
      enable = true;
      enableNushellIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
  };
}
