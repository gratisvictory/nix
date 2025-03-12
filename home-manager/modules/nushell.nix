{username, ...}: {
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        let carapace_completer = {|spans|
          carapace $spans.0 nushell ...$spans | from json
        }

        $env.config = {
          show_banner: false
          completions: {
            case_sensitive: false
            quick: true
            partial: true
            algorithm: "fuzzy"
            external: {
              enable: true
              max_results: 100
              completer: $carapace_completer
            }
          }
        }

        # Динамическое добавление путей
        $env.PATH = ($env.PATH |
          split row (char esep) |
          prepend ($env.HOME | path join ".apps") |
          append /usr/bin/env
        )

        # yazi + переход в рабочую директорию
        def --env y [...args] {
          let tmp = (mktemp -t "yazi-cwd.XXXXXX")
          yazi ...$args --cwd-file $tmp
          let cwd = (open $tmp)
          if $cwd != "" and $cwd != $env.PWD {
            cd $cwd
          }
          rm $tmp
        }

        # Алиасы
        alias v = vim
        alias flake = sudo nixos-rebuild switch --flake /home/${username}/nix

        # Автоматическая настройка Starship в Nushell
        let starship_path = ($nu.data-dir | path join "vendor/autoload/starship.nu")
        mkdir ($nu.data-dir | path join "vendor/autoload")
        if (not (path exists $starship_path)) {
          starship init nu | save -f $starship_path
        }
        use $starship_path
      '';
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = true;
        hostname = {
          ssh_only = false;
          format = "[$ssh_symbol$hostname]($style) ";
          style = "bold purple";
        };
        character = {
          success_symbol = "[ & ](bold green)";
          error_symbol = "[ & ](bold red)";
        };
        username = {
          show_always = true;
          format = "[$user]($style)@";
        };
        directory = {
          read_only = " 🔒";
          truncation_symbol = "…/";
        };
      };
    };
  };
}
