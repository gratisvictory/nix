{pkgs, ...}:
with pkgs; [
  bun
  nodejs_24
  corepack_latest
  typescript
  eslint
  esbuild
  nodePackages.prettier
  http-server
]
