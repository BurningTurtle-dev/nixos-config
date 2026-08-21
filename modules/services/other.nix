{ lib, ... }:

{
  services = {
    udisks2.enable = true;
    gvfs.enable = true;
    pcscd.enable = true;
    mullvad-vpn = {
      enable = true;
      gui.enable = true;
    };
    tailscale = {
      enable = true;
    };
  };

  # start services disabled
  systemd.user.services = {
    tailscale = {
      wantedBy = lib.mkForce [];
    };
  };
}
