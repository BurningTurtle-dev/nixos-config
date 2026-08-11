{ config, pkgs, lib, ... }:

{
  services = {
    udisks2.enable = true;
    mullvad-vpn = {
      enable = true;
      gui.enable = true;
    };
  };
}
