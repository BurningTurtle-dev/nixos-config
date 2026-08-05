
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    htop
    git
    tldr
    mc
    p7zip
    killall
  ];
}

