{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    material-black-colors
    kdePackages.qt6ct
    kdePackages.breeze
  ];

  # Backup existing GTK configs before Home Manager writes its own
  home.activation = {
    backupGtkConfigs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      echo "Checking for existing GTK configs..."
      for file in "$HOME/.config/gtk-3.0/settings.ini" \
                   "$HOME/.config/gtk-4.0/settings.ini" \
                   "$HOME/.gtkrc-2.0"; do
        if [ -f "$file" ] && [ ! -L "$file" ]; then
          echo "Backing up $file to $file.backup"
          mv "$file" "$file.backup"
        fi
      done
    '';
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "MB-Pistachio-Suru-GLOW";
      package = pkgs.material-black-colors;
    };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    cursorTheme = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze-gtk;
    };
    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = true;
    };

    gtk4.extraConfig = {
      "gtk-theme-name" = "Adwaita-dark";
      # Optionally also force dark preference:
      "gtk-application-prefer-dark-theme" = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };
}
