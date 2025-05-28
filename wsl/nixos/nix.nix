{
  username,
  pkgsUnstable,
  flake-inputs,
  lib,
  ...
}: {
  nix = {
    settings = {
      trusted-users = [
        "root"
        username
      ];
      accept-flake-config = true;
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];

      warn-dirty = false; # Отключает предупреждения о грязном git-репозитории
      fallback = true; # Разрешает использование двоичных кэшей, если сборка не удалась
      max-jobs = "auto"; # Автоматически определяет количество параллельных заданий
      cores = 0; # Использует все доступные ядра для сборки
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org" # Кэш nix-community
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    registry.nixpkgs.flake = flake-inputs.nixpkgs-unstable;

    package = pkgsUnstable.nixVersions.latest;

    extraOptions = ''
      keep-outputs = true  # Сохраняет выходные данные сборки
      keep-derivations = true  # Сохраняет деривации
      connect-timeout = 5  # Устанавливает таймаут подключения в секундах
      log-lines = 25  # Ограничивает количество строк лога
      min-free = 128000000  # Минимальное свободное место (в байтах) перед сборкой
    '';

    gc = lib.mkDefault {
      automatic = true; # Включает автоматическую сборку мусора
      options = "--delete-older-than 7d"; # Удаляет пакеты старше 7 дней
      persistent = true; # Делает сборку мусора постоянной
      dates = "weekly"; # Запускает сборку мусора еженедельно
    };

    # Оптимизация использования диска
    optimise = {
      automatic = true; # Автоматически оптимизирует хранилище
      dates = ["weekly"]; # Запускает оптимизацию еженедельно
    };
  };
}
