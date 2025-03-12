{
  stateVersion,
  username,
  ...
}: {
  imports = [
    ./modules
    ./home-packages-wsl.nix
  ];

  home = {
    enableNixpkgsReleaseCheck = false;
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
