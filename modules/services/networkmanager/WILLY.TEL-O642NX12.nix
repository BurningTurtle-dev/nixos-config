
{ config, lib, pkgs, ... }:

{
  sops.secrets."wifi/WILLY.TEL-O642NX12" = { };

  sops.templates."WILLY.TEL-O642NX12.nmconnection" = {
    content = ''
      [connection]
      id=WILLY.TEL-O642NX12
      uuid=8f14e45f-ceea-467e-bd06-9d4a1f0a2b3c
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=WILLY.TEL-O642NX12
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/WILLY.TEL-O642NX12"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/WILLY.TEL-O642NX12.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
