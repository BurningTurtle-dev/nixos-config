
{ lib, config, pkgs, ... }:

{
  imports = [
    ./c.nix
    ./python.nix
    ./latex.nix
  ];
}
