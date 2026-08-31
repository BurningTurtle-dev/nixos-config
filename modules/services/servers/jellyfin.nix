{ pkgs, lib, ... }:

{
  systemd.services.jellyfin = {
    unitConfig.RequiresMountsFor = "/mnt/storage"; # wait for storage to mount
    environment.LIBVA_DRIVER_NAME = "iHD";
    serviceConfig = {
      ProtectSystem = lib.mkForce "strict";
      ProtectHome = true;
      PrivateTmp = true;
      NoNewPrivileges = true;
      ReadWritePaths = [
        "/mnt/storage/jellyfin"
        "/mnt/media"
      ];
    };
  };
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };


  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver          # iHD — correct for Gemini Lake (Broadwell and newer)
      intel-ocl                   # generic OpenCL support
      intel-compute-runtime-legacy1  # Gemini Lake predates 13th gen, use the legacy runtime
    ];
  };

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    dataDir = "/mnt/storage/jellyfin/data";
    cacheDir = "/mnt/storage/jellyfin/cache";
  };
}
