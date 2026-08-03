
{ config, lib, pkgs, ... }:

{
  imports = [
    ./cups.nix
    ./sound.nix
  ];
}
