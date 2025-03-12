{
  description = "NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # stylix = {
    #   url = "github:danth/stylix/release-24.11";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-wsl,
    nix-ld,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    username = "gratisvictory";
    hostname = "nixos";
    stateVersion = "24.11";
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit username hostname stateVersion;
        inherit pkgs;
        inputs = {inherit nixpkgs home-manager nixos-wsl nix-ld;};
      };
      modules = [
        nixos-wsl.nixosModules.wsl
        nix-ld.nixosModules.nix-ld
        ./wsl/nixos/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username} = {...}: {
              imports = [./wsl/home-manager/home-wsl.nix];
              _module.args = {inherit username stateVersion;};
            };
          };
        }
      ];
    };
  };
}
