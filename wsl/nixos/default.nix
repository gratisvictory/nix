{...}: {
  imports = [
    ./env.nix
    ./docker.nix
    ./home-manager.nix
    ./nix.nix
    ./system.nix
    ./user.nix
    ./wsl.nix
  ];
}
