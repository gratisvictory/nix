{
  pkgs,
  username,
  ...
}: {
  users = {
    defaultUserShell = pkgs.nushell;
    users.${username} = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker"];
    };
  };
}
