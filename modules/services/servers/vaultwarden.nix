{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 8222 ];

  systemd.services.vaultwarden = {
    unitConfig = {
      RequiresMountsFor = "/mnt/storage";
      After = [ "mnt-storage.mount" ];
      Requires = [ "mnt-storage.mount" ];
    };
    serviceConfig.ReadWritePaths = [
      "/mnt/storage/vaultwarden"
    ];
  };

  systemd.services.postgresql = {
    unitConfig = {
      After = [ "mnt-storage.mount" ];
      Requires = [ "mnt-storage.mount" ];
    };
    serviceConfig.ReadWritePaths = [
      "/mnt/storage/vaultwarden/postgresql"
    ];
  };

  services.vaultwarden = {
    enable = true;
    package = pkgs.vaultwarden-postgresql;
    dbBackend = "postgresql";

    configureNginx = false;
    configurePostgres = true;
    domain = "https://vault.burningturtle.win";

    environmentFile = "/mnt/storage/vaultwarden/vaultwarden.env";
    config = {
      SIGNUPS_ALLOWED = true;
      #ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "debug";
      #ROCKET_LOG = "critical";

      DATA_FOLDER = "/mnt/storage/vaultwarden/data";
    };
  };

  services.postgresql = {
    dataDir = "/mnt/storage/vaultwarden/postgresql";
  };
}
