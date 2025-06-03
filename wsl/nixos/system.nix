{...}: {
  time.timeZone = "Europe/Samara";
  environment.enableAllTerminfo = true;
  security.sudo.wheelNeedsPassword = false;
  services.openssh.enable = true;
}
