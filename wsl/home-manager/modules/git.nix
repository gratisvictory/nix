{
  programs.git = {
    enable = true;
    userName = "gratisvictory";
    userEmail = "gratisvictory.dev@proton.me";

    extraConfig = {
      core = {
        editor = "code --wait";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };

      delta = {
        enable = true;
        options = {
          line-numbers = true;
          side-by-side = true;
          navigate = true;
        };
      };

      aliases = {
        whoami = "config user.name && git config user.email && git config core.sshCommand";
      };

      # 👇 Добавляем автоматическое подключение поддиректорий
      includeIf = {
        "gitdir:~/projects/gratisvictory/" = {
          path = "~/.config/git/gratisvictory.gitconfig";
        };
        "gitdir:~/projects/alex/" = {
          path = "~/.config/git/alex.gitconfig";
        };
        "gitdir:~/projects/demonicattack/" = {
          path = "~/.config/git/demonicattack.gitconfig";
        };
      };
    };
  };

  # Генерация вложенных gitconfig файлов для аккаунтов
  home.file = {
    ".config/git/gratisvictory.gitconfig".text = ''
      [user]
        name = "gratisvictory"
        email = "gratisvictory.dev@proton.me"
      [core]
        sshCommand = "ssh github.com-gratisvictory"
    '';

    ".config/git/alexborzov.gitconfig".text = ''
      [user]
        name = "alexborzov"
        email = "alex.borzov@proton.me"
      [core]
        sshCommand = "ssh github.com-alexborzov"
    '';

    ".config/git/demonicattack.gitconfig".text = ''
      [user]
        name = "demonicattack"
        email = "demonicattack@proton.me"
      [core]
        sshCommand = "ssh github.com-demonicattack"
    '';
  };
}
