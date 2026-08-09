
{ config, lib, pkgs, ... }:

{
  imports = [
    ./cups.nix
    ./sound.nix
    ./displaymanager.nix
    ./flatpak.nix
    ./other.nix
  ];
}
