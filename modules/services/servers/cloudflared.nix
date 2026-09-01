{ config, ... }:

{
  sops.secrets."cloudflared-naspi-creds" = {
    owner = "root";
    group = "root";
    mode = "0400";
  };

  services.cloudflared = {
    enable = true;
    tunnels = {
      "797a7170-ee50-4c04-9cfa-a688c53912fb" = {
        credentialsFile = config.sops.secrets."cloudflared-naspi-creds".path;
        default = "http_status:404";
        ingress = {
          "vault.burningturtle.win" = "http://localhost:8222";
          "opencloud.burningturtle.win" = "http://localhost:7218";
        };
      };
    };
  };
}
