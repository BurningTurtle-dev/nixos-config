
{ config, ... }:

{
  sops.secrets."wifi/UNI/cacert" = {
    sopsFile = ../../../secrets/cacert.crt;
    format = "binary";
    owner = "root";
    mode = "0400";
  };

  sops.secrets."wifi/UNI/email" = { };
  sops.secrets."wifi/UNI/psk" = { };
  sops.secrets."wifi/UNI/identity" = { };
  sops.secrets."wifi/UNI/domain-suffix" = { };

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
      anonymous-identity=${config.sops.placeholder."wifi/UNI/identity"}
      ca-cert=${config.sops.secrets."wifi/UNI/cacert".path}
      domain-suffix-match=${config.sops.placeholder."wifi/UNI/domain-suffix"}
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
