
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (pkgs.callPackage ./opencloud.nix { })
  ];
}
