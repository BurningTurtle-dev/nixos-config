
{ config, ... }:

{
  sops.secrets."wifi/MTEL-8901" = { };

  sops.templates."MTEL-8901.nmconnection" = {
    content = ''
      [connection]
      id=MTEL-8901
      uuid=74169202-41ad-43a4-aba4-834fae6d4cf4
      type=wifi
      permissions=

      [wifi]
      mode=infrastructure
      ssid=MTEL-8901
      mac-address-blacklist=

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi/MTEL-8901"}

      [ipv4]
      method=auto
      dns-search=

      [ipv6]
      method=auto
      addr-gen-mode=stable-privacy
      dns-search=
    '';
    path = "/etc/NetworkManager/system-connections/MTEL-8901.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
