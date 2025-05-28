{
  description = "NixOS @gratisvictory configuration";
  inputs = {
    # packages
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    # home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    # Dynamic library (vscode)
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs-unstable";
    # WSL
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs-unstable,
    nixpkgs-stable,
    home-manager,
    nixos-wsl,
    nix-ld,
    ...
  }: let
    system = "x86_64-linux";
    username = "gratisvictory";
    hostname = "nixos";
    stableVersion = nixpkgs-stable.lib.trivial.release;
    stateVersion = stableVersion;

    # nixpkgs (unstable)
    pkgsUnstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    # nixpkgs (stable)
    pkgsStable = import nixpkgs-stable {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    # overlay (unstable)
    overlay-unstable = final: prev: {
      unstable = pkgsUnstable;
    };

    # overlay (stable)
    overlay-stable = final: prev: {
      stable = pkgsStable;
    };
  in {
    # NixOS configuration
    nixosConfigurations.${hostname} = nixpkgs-unstable.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit username hostname stateVersion pkgsUnstable pkgsStable;
        flake-inputs = {inherit nixpkgs-unstable nixpkgs-stable home-manager nixos-wsl nix-ld;};
      };
      modules = [
        ({
          flake-inputs,
          lib,
          config,
          ...
        }: {
          nixpkgs.overlays = [
            overlay-unstable
            overlay-stable
          ];
          imports = [
            flake-inputs.nixos-wsl.nixosModules.wsl
            flake-inputs.nix-ld.nixosModules.nix-ld
            {
              programs.nix-ld.dev.enable = true;
              programs.nix-ld.libraries = flake-inputs.nix-ld.packages.${system}.default.libraries;
            }
            ./wsl/nixos/default.nix
            flake-inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit pkgsUnstable pkgsStable;
                };
                users.${username} = {...}: {
                  imports = [./wsl/home-manager/home-wsl.nix];
                  _module.args = {
                    inherit username stateVersion pkgsUnstable pkgsStable;
                  };
                };
              };
            }
          ];
        })
      ];
    };
  };
}
