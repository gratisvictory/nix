{
  description = "My C Project with libcheck";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          check
          pkg-config
          gcc
          gdb
          gnumake
          valgrind
          lcov
          clang-tools
          subunit
          firefox
          xdg-utils
          cppcheck
        ];
      };
    });
}
