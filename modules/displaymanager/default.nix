
{  config, lib, pkgs, ... }:

{
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
}
