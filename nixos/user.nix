{
  pkgs,
  username,
  ...
}: {
  users = {
    defaultUserShell = pkgs.nushell;
    users.${username} = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker" "networkmanager"];
    };
  };

  services.getty.autologinUser = username;

  networking.networkmanager.enable = true;
}
