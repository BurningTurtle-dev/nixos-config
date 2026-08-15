
{ config, lib, pkgs, ... }:

{
  sops.secrets."wifi/UNI/email" = { };
  sops.secrets."wifi/UNI/psk" = { };

  sops.templates."UNI.nmconnection" = {
    content = ''
      [connection]
      id=eduroam
      uuid=1a6686c9-ebe4-4315-be5e-81f083f3cf92
      type=wifi
      
      [wifi]
      mode=infrastructure
      ssid=eduroam
      
      [wifi-security]
      key-mgmt=wpa-eap
      
      [802-1x]
      anonymous-identity=anonymous@uni-hamburg.de
      ca-cert=/etc/nixos/modules/services/networkmanager/certs/cacert.crt
      domain-suffix-match=uni-hamburg.de
      eap=ttls;
      identity=${config.sops.placeholder."wifi/UNI/email"}
      password=${config.sops.placeholder."wifi/UNI/psk"}
      phase2-auth=pap
      
      [ipv4]
      method=auto
      
      [ipv6]
      addr-gen-mode=stable-privacy
      method=auto
    '';
    path = "/etc/NetworkManager/system-connections/UNI.nmconnection";
    owner = "root";
    group = "root";
    mode = "0600";
  };
}
