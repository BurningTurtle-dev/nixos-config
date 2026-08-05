
{ config, pkgs, ... }:

{
  # Packages you want available just for this user (as opposed to
  # environment.systemPackages, which is system-wide)
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
    gparted
    krita
    libreoffice
    mpv
    vlc
    kdePackages.okular
    qbittorrent
    tailscale
    unityhub
    zoom-us
  ];
}
