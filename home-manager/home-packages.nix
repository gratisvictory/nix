{
  pkgs,
  lib,
  isWSL,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps (disabled for WSL)
    anki
    code-cursor
    imv
    mpv
    obs-studio
    obsidian
    pavucontrol
    teams-for-linux
    telegram-desktop
    vesktop
    docker

    # CLI utils
    yazi
    lazygit
    bat
    bottom
    coreutils
    curl
    du-dust
    fd
    fx
    git
    git-crypt
    htop
    jq
    fnm
    killall
    ripgrep
    sd
    unzip
    vim
    wget
    zip
    nushell
    nufmt
    starship
    gh
    rustup
    cargo-cache
    cargo-expand
    tree-sitter
    nil
    alejandra
    deadnix
    shellcheck
    shfmt
    statix

    # CLI utils (cont.)
    bc
    brightnessctl
    cliphist
    ffmpeg
    ffmpegthumbnailer
    fzf
    git-graph
    grimblast
    hyprpicker
    ntfs3g
    mediainfo
    microfetch
    playerctl
    showmethekey
    silicon
    udisks
    ueberzugpp
    w3m
    wl-clipboard
    wtype
    yt-dlp

    # Languages
    bash
    c
    dart
    dockerfile
    go
    json
    jsonnet
    markdown
    nix
    packer
    python
    rust
    terraform
    toml
    typescript
    typst
    yaml

    # Coding tools
    openjdk23
    nodejs
    python311

    # Utils for languages
    dockfmt

    # WM stuff (disabled for WSL)
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    bemoji
    nix-prefetch-scripts
  ];
}
