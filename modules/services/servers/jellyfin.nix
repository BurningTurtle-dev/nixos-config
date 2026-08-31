{ pkgs, ... }:

{
  systemd.services.jellyfin.environment.LIBVA_DRIVER_NAME = "iHD";
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
    dataDir = "/data/jellyfin/data";
    cacheDir = "/data/jellyfin/cache";
  };
}
