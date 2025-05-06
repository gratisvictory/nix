{
  programs = {
    nushell = {
      enable = true;
      configFile.source = ../../../nushell/config.nu;
    };
    carapace.enable = false;
    carapace.enableNushellIntegration = false;
  };
}
