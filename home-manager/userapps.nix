
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vscodium
    obsidian
    openscad
    seafile-client
    jstest-gtk
    qalculate-gtk
    brave-origin
    signal-desktop
    arduino-ide
    kdePackages.ark
    calibre
    wdisplays
    gammastep
    krita
    libreoffice
    mpv
    vlc
    kdePackages.okular
    qbittorrent
    tailscale
    unityhub
    zoom-us
    fastfetch
    hyprpolkitagent
    gparted
    seafile-client
    gedit
    geany
  ];
}
