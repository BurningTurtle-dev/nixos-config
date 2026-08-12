
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscodium
    obsidian
    openscad
    seafile-client
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
    zoom-us
    tailscale-systray
    fastfetch
    gparted
    seafile-client
    gedit
    file-roller
    xournalpp
    jellyfin-desktop
    imv
    yt-dlp
    wiremix
  ];
}
