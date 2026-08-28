
{ pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    theme = lib.mkForce ./custom.rasi;
    font = lib.mkForce "sans-serif";
    package = pkgs.rofi;
    modes = [
      "drun"
      "run"
      "window"
      "ssh"
    ];
    extraConfig = {
      show-icons = true;
      icon-theme = lib.mkForce "Adwaita";
    };
  };
}

