{username, ...}: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = ../../../nushell/config.nu;
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;
  };
}
