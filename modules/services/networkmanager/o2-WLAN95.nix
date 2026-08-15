
{ config, lib, pkgs, ... }:

{
  sops.secrets."wifi/o2-WLAN95" = { };

  sops.templates."o2-WLAN95.nmconnection" = {
    content = ''
      [connection]
      id=o2-WLAN95
      uuid=2e403b2a-f410-47ef-8137-6294011734be
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=o2-WLAN95
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/o2-WLAN95"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/o2-WLAN95.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
