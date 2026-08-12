
{ config, ... }:

{
  sops.secrets."wifi/Vasiles5G" = { };

  sops.templates."Vasiles5G.nmconnection" = {
    content = ''
      [connection]
      id=Vasiles5G
      uuid=2c46efa0-7179-4e8c-8581-78f803a93ede
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=Vasiles5G
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/Vasiles5G"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/Vasiles5G.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
