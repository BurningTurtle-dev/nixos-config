{ pkgs, ... }:

{
  home.packages = with pkgs; [
    stlink
    jstest-gtk
  ];
}
