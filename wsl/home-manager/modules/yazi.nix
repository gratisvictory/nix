{...}: {
  programs.yazi = {
    enable = true;

    settings = {
      manager = {
        show_hidden = false;
        show_symlink = true;
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "size";

        preview = true;
        preview_tabwidth = 2;
        preview_shown_ratio = 0.5;
      };

      opener = {
        text = ["nvim"];
        image = ["imv"];
        video = ["mpv"];
        pdf = ["zathura"];
        archive = ["unar"];
        fallback = ["xdg-open"];
      };

      search = {
        ignore_case = true;
        smart_case = true;
        wrap_around = true;
        regex = false;
      };

      ui = {
        border_type = "rounded";
        border_style = "blue";
        show_icons = true;
      };
    };

    keymap = {
      normal = {
        "h" = "leave";
        "j" = "down";
        "k" = "up";
        "l" = "enter";

        "y" = "copy";
        "x" = "cut";
        "p" = "paste";
        "d" = "remove";

        "/" = "search";
        "f" = "filter";
        "c" = "clear";

        "s" = "sort";
        "r" = "sort_reverse";

        "space" = "toggle_preview";

        "m" = "mark";
        "'" = "goto_mark";
      };
    };
  };
}
