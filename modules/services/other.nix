{ ... }:

{
  services = {
    gvfs.enable = true;
    pcscd.enable = true;
    tailscale = {
      enable = true;
    };
  };

  # start services disabled
  systemd.user.services = {
    #tailscale = {
    #  wantedBy = lib.mkForce [];
    #};
  };
}
