
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    alacritty
    htop
    librewolf-bin
    git
    waybar
    wlogout
    rofi
    cliphist
    wl-clipboard
    grim
    slurp
    jq
    brightnessctl
    kdePackages.dolphin
    kdePackages.kdeconnect-kde
    # mullvad-vpn
    tldr
  ];
}

