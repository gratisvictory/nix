{
  description = "JavaScript/TypeScript development environment";

  inputs = {
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixos-unstable,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixos-unstable {
        inherit system;
      };

      packages = import ./pkgs.nix {inherit pkgs;};
    in {
      devShells.default = pkgs.mkShell {
        name = "frontend-dev-shell";
        buildInputs = packages;
        shellHook = ''
          echo "Welcome to your JavaScript/TypeScript development environment!"
        '';
      };
    });
}
