# Core alias
alias v = vim
alias nv = neovim
alias fast = fastfetch
alias nixver = nixos-version
alias nixcollect = sudo nix-collect-garbage -d
alias flake = sudo nixos-rebuild switch --flake ~/nix
alias flakeup = nix flake update
alias flakereboot = sudo nixos-rebuild switch --flake ~/nix --reboot
alias pref = nix-prefetch-url
alias del = sudo nix-store --gc

# Yarn berry alias
alias y = yarn
alias yb = yarn build
alias ycc = yarn cache clean
alias ya = yarn add
alias yi = yarn init
alias yf = yarn format
alias yff = yarn format:fix
alias yl = yarn lint
alias ylf = yarn lint:fix
alias yd = yarn dev
alias yrm = yarn remove
alias yrun = yarn run
alias yst = yarn start
alias ys = yarn serve
alias yt = yarn test
alias ytc = yarn test --coverage
alias yui = yarn upgrade-interactive
alias yup = yarn upgrade
alias yw = yarn workspace
alias yws = yarn workspaces
alias yad = yarn add -D
alias yap = yarn add -P
alias yii = yarn install --immutable
alias ydlx = yarn dlx

# Cargo alias
alias cb = cargo build
alias cr = cargo run
alias ca = cargo add

# Pnpm alias
alias pc = pnpm clean
alias prv = pnpm preview
alias pb = pnpm build
alias pad = pnpm add -D
alias pi = pnpm install
alias pd = pnpm dev
alias pa = pnpm add
alias ps = pnpm start
alias pl = pnpm lint
alias plf = pnpm lint:fix
alias pf = pnpm format
alias pff = pnpm format:fix
alias pt = pnpm test
alias ptc = yarn test --coverage
alias pdlx = pnpm dlx
alias pexec = pnpm exec
alias pup = pnpm update
alias prm = pnpm remove
alias pg = pnpm generate
