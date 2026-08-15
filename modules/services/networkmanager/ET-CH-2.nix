
{ config, lib, pkgs, ... }:

{
  sops.secrets."wifi/ET-CH-2" = { };

  sops.templates."ET-CH-2.nmconnection" = {
    content = ''
      [connection]
      id=ET-CH-2
      uuid=c2e1537e-a614-4f49-99b8-14493b28bb1c
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=ET-CH-2
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/ET-CH-2"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/ET-CH-2.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
