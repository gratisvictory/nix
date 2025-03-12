{
  environment.sessionVariables = rec {
    TERMINAL = "nushell";
    EDITOR = "code";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };
}
