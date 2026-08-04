
{ lib, config, pkgs, ... }:

{
  imports = [
    ./rofi.nix
    ./sway/home.nix
  ];
}
