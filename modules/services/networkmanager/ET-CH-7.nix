
{ config, lib, pkgs, ... }:

{
  sops.secrets."wifi/ET-CH-7" = { };

  sops.templates."ET-CH-7.nmconnection" = {
    content = ''
      [connection]
      id=ET-CH-7
      uuid=ec43193c-1d01-4dfe-9cce-7e7c4f47b035
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=ET-CH-7
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/ET-CH-7"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/ET-CH-7.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
