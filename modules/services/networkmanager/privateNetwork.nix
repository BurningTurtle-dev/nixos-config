
{ config, lib, pkgs, ... }:

{
  sops.secrets."wifi/privateNetwork" = { };

  sops.templates."privateNetwork.nmconnection" = {
    content = ''
      [connection]
      id=privateNetwork
      uuid=d5ee491e-98bb-4153-86ad-139fd31de943
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=privateNetwork
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/privateNetwork"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/privateNetwork.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
