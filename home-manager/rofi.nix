
{ config, lib, pkgs, ... }:

let
  theme = ../dotconfigs/rofi/custom.rasi;
in
{
  programs.rofi = {
    enable = true;
    theme = theme;
    font = "sans-serif";
    package = pkgs.rofi;
    modes = [
      "drun"
      "run"
      "window"
      "ssh"
    ];
    extraConfig = {
      show-icons = true;
    };
  };
}

