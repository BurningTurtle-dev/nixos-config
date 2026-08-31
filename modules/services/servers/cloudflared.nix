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
          "naspi.example.com" = "http://localhost:8080";
        };
      };
    };
  };
}
