
{ config, pkgs, ... }:
let
  tex = (pkgs.texliveBasic.withPackages (
    ps: with ps; [
      #dvisvgm
  ]));
in
{
  home.packages = with pkgs; [
    tex
    texmaker
  ];
}
