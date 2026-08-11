
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vscodium
    obsidian
    openscad
    seafile-client
    jstest-gtk
    qalculate-gtk
    texstudio
    brave-origin
    signal-desktop
    arduino-ide
    kdePackages.ark
    calibre
    wdisplays
    gammastep
    kdePackages.kate
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
  ];
}
