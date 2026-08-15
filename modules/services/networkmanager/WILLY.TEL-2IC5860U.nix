
{ config, lib, pkgs, ... }:

{
  sops.secrets."wifi/WILLY.TEL-2IC5860U" = { };

  sops.templates."WILLY.TEL-2IC5860U.nmconnection" = {
    content = ''
      [connection]
      id=WILLY.TEL-2IC5860U
      uuid=8f14e45f-ceea-467e-bd06-9d4a1f0a2b3c
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=WILLY.TEL-2IC5860U
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/WILLY.TEL-2IC5860U"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/WILLY.TEL-2IC5860U.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
