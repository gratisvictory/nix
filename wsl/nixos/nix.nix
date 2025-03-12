{
  username,
  pkgs,
  inputs,
  ...
}: {
  nix = {
    settings = {
      trusted-users = [
        "root"
        username
      ];
      accept-flake-config = true;
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };

    registry.nixpkgs.flake = inputs.nixpkgs;

    package = pkgs.nixVersions.stable;

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      persistent = true;
    };
  };
}
