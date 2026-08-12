
{ config, ... }:

{
  sops.secrets."wifi/Vasiles2.4g" = { };

  sops.templates."Vasiles2.4g.nmconnection" = {
    content = ''
      [connection]
      id=Vasiles2.4g
      uuid=42520c06-47f0-4640-8048-b067a9ed67f5
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=Vasiles2.4g
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/Vasiles2.4g"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/Vasiles2.4g.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
