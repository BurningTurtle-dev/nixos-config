
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    openscad
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
    gedit
    file-roller
    jellyfin-desktop
    imv
    yt-dlp
    wiremix
    devenv
    speedtest-cli
  ];
}
