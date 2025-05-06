# NixOS WSL Configuration

This repository contains my personal NixOS configuration for Windows Subsystem for Linux (WSL). It includes system configuration, home-manager settings, and various development environments.

## 🚀 Quick Start

### Prerequisites
- Windows 10/11 with WSL2 enabled
- NixOS WSL distribution image (`nixos.wsl`)

### Installation Steps

1. **Create WSL Directory**
   ```bash
   mkdir C:\Users\<username>\AppData\Local\WSL\NixOS
   ```

2. **Import NixOS WSL Distribution**
   ```bash
   wsl --import NixOS C:\Users\<username>\AppData\Local\WSL\NixOS C:\Users\<username>\Downloads\nixos.wsl --version 2
   ```

3. **Start NixOS WSL**
   ```bash
   wsl -d NixOS
   ```

4. **Update System**
   ```bash
   sudo nix-channel --update && sudo nixos-rebuild switch
   ```

5. **Clone Configuration**
   ```bash
   git clone https://github.com/gratisvictory/nix.git /tmp/nix
   cd /tmp/nix
   ```

6. **Apply Configuration and Restart**
   ```bash
   sudo nixos-rebuild switch --flake /tmp/nix && sudo shutdown -h now
   ```

7. **Start NixOS WSL Again**
   ```bash
   wsl -d NixOS
   ```

8. **Move Configuration to Home Directory**
   ```bash
   mv /tmp/nix ~/nix
   ```

9. **Setup NuShell Configuration**
   ```bash
   sudo rm -rf ~/.config/nushell/
   sudo cp ~/nix/nushell/* ~/.config/nushell
   ```

10. **Final System Update**
    ```bash
    sudo nixos-rebuild switch --flake ~/nix
    ```

## 📁 Repository Structure

```
.
├── flakes/           # Development environment flakes
│   ├── clang/       # C/C++ development environment
│   └── wsl/         # WSL-specific configurations
├── wsl/             # WSL system configuration
│   ├── nixos/       # NixOS system modules
│   └── home-manager/ # Home-manager configuration
└── nushell/         # NuShell configuration files
```

## 🔧 Configuration

### System Configuration
- Located in `wsl/nixos/`
- Includes system-wide settings, services, and packages

### Home Manager
- Located in `wsl/home-manager/`
- Manages user-specific configurations and packages

### Development Environments
- Located in `flakes/`
- Contains specialized development environments for different programming languages

## 🛠️ Usage

### Updating System
```bash
sudo nixos-rebuild switch --flake ~/nix
```

### Adding New Packages
Edit the appropriate configuration file in `wsl/nixos/` or `wsl/home-manager/` and rebuild the system.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

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
