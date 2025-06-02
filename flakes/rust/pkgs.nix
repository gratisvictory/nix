{pkgs, ...}:
with pkgs; [
  rustup
  pkg-config
  gdb
  strace
  ltrace
  gcc
  man-pages
  cargo
  cargo-cache
  cargo-edit
  cargo-watch
  cargo-expand
  cargo-outdated
  cargo-audit
  cargo-flamegraph
]
