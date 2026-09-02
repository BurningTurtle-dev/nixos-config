{ ... }:

{
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos#thinkcentre";
    flags = [
      "--print-build-logs"
      "--commit-lock-file"  # If you want to automatically commit the updated flake.lock
    ];
    dates = "04:00";
    randomizedDelaySec = "45min";
  };
}
