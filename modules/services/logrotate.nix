{ ... }:

{
  services.logrotate = {
    enable = true;

    settings = {
      header = {
        frequency = "daily";
        rotate = 7;
        create = "644 root root";
        compress = true;
        delaycompress = true;
        notifempty = true;
        missingok = true;
      };

      "/var/log/*.log" = {};
      "/mnt/storage/jellyfin/data/log/*.log" = {};
    };
  };
}
