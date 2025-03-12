{
  username,
  hostname,
  stateVersion,
  ...
}: {
  networking.hostName = hostname;
  system.stateVersion = stateVersion;

  wsl = {
    enable = true;
    defaultUser = username;
    startMenuLaunchers = true;
    docker-desktop.enable = true;

    wslConf = {
      interop.enable = true;
      automount.enabled = true;
      automount.root = "/mnt";
      interop.appendWindowsPath = false;
      network.generateHosts = false;
    };
  };
}
