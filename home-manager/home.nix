{
  stateVersion,
  username,
  ...
}: {
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };

  direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
