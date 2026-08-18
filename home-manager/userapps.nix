
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscodium
    obsidian
    openscad
    seafile-client
    jstest-gtk
    qalculate-gtk
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
    file-roller
    xournalpp
    jellyfin-desktop
    imv
    yt-dlp
  ];
}
