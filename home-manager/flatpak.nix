
{ config, pkgs, ... }:

{
  services.flatpak = {
    packages = [
      "org.pvermeer.WebAppHub"
    ];
  };
}
