{ pkgs, ... }:

{
  systemd.services.flake-update = {
    description = "Update flake.lock";
    serviceConfig.Type = "oneshot";
    script = ''
      cd /etc/nixos
      ${pkgs.nix}/bin/nix flake update --commit-lock-file
    '';
  };

  systemd.timers.flake-update = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "Sun *-*-* 03:30";  # 30 min before the rebuild
      Persistent = true;
    };
  };

  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos#thinkcentre";
    flags = [
      "--print-build-logs"
      "--commit-lock-file"  # If you want to automatically commit the updated flake.lock
    ];
    dates = "Sun *-*-* 04:00";
    randomizedDelaySec = "45min";
  };
}
