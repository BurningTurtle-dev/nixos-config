{ config, ... }:
{
  #networking.firewall.allowedTCPPorts = [ 8222 ];

  sops.secrets."vaultwarden-env" = {
    sopsFile = ../../../secrets/vaultwarden.env;
    format = "binary";
  };

  systemd.tmpfiles.rules = [
    "d /mnt/storage/vaultwarden/data 0700 vaultwarden vaultwarden -"
  ];

  systemd.mounts = [{
    what = "/mnt/storage/vaultwarden/data";
    where = "/var/lib/vaultwarden";
    type = "none";
    options = "bind";
    after = [ "mnt-storage.mount" ];
    requires = [ "mnt-storage.mount" ];
    unitConfig.RequiresMountsFor = "/mnt/storage";
  }];

  systemd.services.vaultwarden = {
    after = [ "var-lib-vaultwarden.mount" ];
    requires = [ "var-lib-vaultwarden.mount" ];
  };

  systemd.services.backup-vaultwarden = {
    after = [ "var-lib-vaultwarden.mount" ];
    requires = [ "var-lib-vaultwarden.mount" ];
  };

  services.vaultwarden = {
    enable = true;
    backupDir = "/mnt/storage/vaultwarden/backup";
    environmentFile = config.sops.secrets."vaultwarden-env".path;
    config = {
      DOMAIN = "https://vault.burningturtle.win";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
    };
  };
}
