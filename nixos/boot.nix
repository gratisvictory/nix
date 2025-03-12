{
  boot = {
    loader = {
      systemd-boot.enable = true;
    };
    efi = {
      canTouchEfiVariables = false;
    };
    tmp = {
      cleanOnBoot = true;
    };
  };
}
