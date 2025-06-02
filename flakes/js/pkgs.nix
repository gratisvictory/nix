{pkgs, ...}:
with pkgs; [
  bun
  nodejs_24
  corepack_latest
  fnm
  typescript
  eslint
  esbuild
  nodePackages.prettier
  http-server
]
