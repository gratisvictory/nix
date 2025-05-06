{
  description = "C development environment";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };

      cPackages = import ./pkgs.nix {inherit pkgs;};
    in {
      devShells.default = pkgs.mkShell {
        name = "c-dev-shell";
        buildInputs = cPackages;
        shellHook = ''
          echo "Welcome to the C development shell!"
        '';
      };
    });
}
