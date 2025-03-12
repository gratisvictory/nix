{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
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
    killall
    ripgrep
    eza
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
    fnm
    wl-clipboard
    wtype
    yt-dlp

    # Languages
    bash
    go
    # terraform
    typescript

    # Coding tools
    openjdk23
    nodejs

    # Utils for languages
    dockfmt

    # Other
    bemoji
    nix-prefetch-scripts
  ];
}
