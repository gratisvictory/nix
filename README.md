# nix

```bash
mkdir C:\Users\<username>\AppData\Local\WSL\NixOS
```

```bash
wsl --import NixOS C:\Users\<username>\AppData\Local\WSL\NixOS C:\Users\<username>\Downloads\nixos.wsl --version 2
```

```bash
wsl -d NixOS
```

```bash
sudo nix-channel --update && sudo nixos-rebuild switch
```

```bash
git clone https://github.com/gratisvictory/nix.git /tmp/nix
cd /tmp/nix
```

```bash
sudo nixos-rebuild switch --flake /tmp/nix && sudo shutdown -h now
```

```bash
wsl -d NixOS
```

```bash
mv /tmp/nix ~/nix
```

```bash
sudo rm -rf ~/.config/nushell/
```

```bash
sudo rm -rf ~/.config/nushell/
sudo cp ~/nix/nushell/* ~/.config/nushell
```

```bash
sudo nixos-rebuild switch --flake ~/nix
```
