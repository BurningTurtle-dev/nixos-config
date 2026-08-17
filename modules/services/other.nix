{ ... }:

{
  services = {
    udisks2.enable = true;
    gvfs.enable = true;
    pcscd.enable = true;
    mullvad-vpn = {
      enable = true;
      gui.enable = true;
    };
  };
}
