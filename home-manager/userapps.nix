
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
    zoom-us
    fastfetch
    gparted
    seafile-client
    gedit
    zathura
    zathuraPkgs.zathura_pdf_mupdf
    file-roller
    xournalpp
    jellyfin-desktop
  ];
}
