{
  pkgs,
  nixpkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Languages
    nix
    bash
    libgcc
    go
    typescript
    nodejs
    rustup
    python311
    # Utils
    silicon
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
    valgrind
    lcov
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
