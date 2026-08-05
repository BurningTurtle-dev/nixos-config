{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    material-black-colors
    kdePackages.qt6ct
    adwaita-qt6
    kdePackages.breeze
    kdePackages.kconfig
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
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "kde";
  };

  home.file.".config/kdeglobals" = {
    text = ''
      [General]
      ColorScheme=BreezeDark
      Name=Breeze Dark

      [Icons]
      Theme=MB-Pistachio-Suru-GLOW

      [KDE]
      widgetStyle=Breeze
    '';
    force = true;
  };

  home.file.".local/share/color-schemes/BreezeDark.colors".source = "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors";
}
