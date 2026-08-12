
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
    calibre
    wdisplays
    gammastep
    krita
    libreoffice
    mpv
    vlc
    qbittorrent
    tailscale
    unityhub
    zoom-us
    fastfetch
    hyprpolkitagent
    gparted
    seafile-client
    gedit
    zathura
    zathuraPkgs.zathura_pdf_mupdf
    file-roller
    xournalpp
  ];
}
