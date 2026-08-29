
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    openscad
    seafile-client
    qalculate-gtk
    signal-desktop
    calibre
    wdisplays
    gammastep
    krita
    libreoffice
    mpv
    vlc
    qbittorrent
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
    devenv
  ];
}
