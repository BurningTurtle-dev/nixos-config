{ lib, ... }:

{
  services = {
    gvfs.enable = true;
    pcscd.enable = true;
    mullvad-vpn = {
      enable = true;
      gui.enable = false;
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
