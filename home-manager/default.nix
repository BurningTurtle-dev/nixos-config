
{ ... }:

{
  imports = [
    ./rofi/rofi.nix
    ./custom_scripts/default.nix
    ./development/default.nix
    ./sway.nix
    ./alacritty.nix
    ./themes.nix
    ./userapps.nix
    ./librewolf.nix
    ./nixvim.nix
    ./tmux.nix
    ./flatpak.nix
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
      "text/plain" = "org.gnome.gedit.desktop";
    };
  };
}
