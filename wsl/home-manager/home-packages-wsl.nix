{
  pkgs,
  nixpkgs,
  pkgs24_11,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Languages
    nix
    bash
    go
    zig
    typescript
    nodejs
    rustup
    # python311
    # Utils
    # firefox
    xdg-utils
    cacert
    silicon
    nix-direnv
    git-graph
    microfetch
    fzf
    ntfs3g
    bc
    statix
    shellcheck
    deadnix
    tree-sitter
    zip
    gh
    wget
    vim
    unzip
    eza
    sd
    ripgrep
    killall
    jq
    fx
    curl
    fd
    du-dust
    coreutils
    bat
    htop
    bottom
    nushell
    starship
    git
    git-crypt
    helix
    carapace
    prisma
    eslint
    nodePackages.prettier
    dockfmt
    cargo-cache
    cargo-expand
    fnm
    fastfetch
    alejandra
    corepack_latest
    bun
    yazi
    lazygit
    lazydocker
  ];
}
