
{ lib, config, pkgs, ... }:

{
  imports = [
    ./rofi/rofi.nix
    ./sway/home.nix
  ];
}
