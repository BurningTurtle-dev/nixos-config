
{ lib, config, pkgs, ... }:

{
  imports = [
    ./rofi/rofi.nix
    ./sway/home.nix
    ./alacritty.nix
    ./themes.nix
  ];
}
