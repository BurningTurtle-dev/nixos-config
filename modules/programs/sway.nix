
{ config, lib, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    # Don't add extraConfig or other settings here - let home-manager handle it
  };
}
