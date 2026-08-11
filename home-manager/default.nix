
{ lib, config, pkgs, ... }:

{
  imports = [
    ./rofi/rofi.nix
    ./development/default.nix
    ./sway.nix
    ./alacritty.nix
    ./themes.nix
    ./userapps.nix
    ./librewolf.nix
    ./nixvim.nix
    ./flatpak.nix
  ];
}
