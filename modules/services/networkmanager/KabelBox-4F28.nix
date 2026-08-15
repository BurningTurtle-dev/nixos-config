
{ config, lib, pkgs, ... }:

{
  sops.secrets."wifi/KabelBox-4F28" = { };

  sops.templates."KabelBox-4F28.nmconnection" = {
    content = ''
      [connection]
      id=KabelBox-4F28
      uuid=1256036e-ae9e-47d0-be74-12eb28a31e1d
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=KabelBox-4F28
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/KabelBox-4F28"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/KabelBox-4F28.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
