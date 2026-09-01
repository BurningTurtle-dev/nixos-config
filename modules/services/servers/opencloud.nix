{ config, ... }:

{
  sops.secrets."opencloud-env" = {
    sopsFile = ../../../secrets/opencloud.yaml;
  };

  services.opencloud = {
    enable = true;
    url = "https://opencloud.burningturtle.win";
    address = "127.0.0.1";
    port = 7218;

    stateDir = "/mnt/storage/opencloud/data";
    
    environment = {
      PROXY_TLS = "false"; # disable https when behind reverse-proxy
    };
    environmentFile = config.sops.secrets."opencloud-env".path;
  };
}
