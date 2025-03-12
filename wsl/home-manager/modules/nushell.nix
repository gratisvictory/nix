{username, ...}: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = ../../;
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;
  };
}
