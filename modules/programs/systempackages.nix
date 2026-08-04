
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    #alacritty
    htop
    git
    #waybar
    #wlogout
    #rofi
    #cliphist
    #wl-clipboard
    #grim
    #slurp
    #jq
    #brightnessctl
    #kdePackages.dolphin
    #kdePackages.kdeconnect-kde
    # mullvad-vpn
    tldr
    mc
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
    p7zip
  ];
}

