{ ... }:

{
  programs.auto-cpufreq.enable = true;

  programs.auto-cpufreq.settings = {
    charger = {
      governor = "performance";
      turbo = "auto";
    };

    battery = {
      governor = "performance";
      #governor = "powersave";
      turbo = "auto";
    };
  };

  services = {
    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "ignore";
      HandleLidSwitchDocked = "ignore";
    };

    tlp = {
      enable = true;

      settings = {
        # Leave out ALL CPU_* keys entirely — no CPU_SCALING_GOVERNOR_ON_AC/BAT,
        # no CPU_BOOST_ON_AC/BAT, no CPU_ENERGY_PERF_POLICY_ON_AC/BAT,
        # no CPU_MIN_PERF_ON_AC/BAT / CPU_MAX_PERF_ON_AC/BAT,
        # no PLATFORM_PROFILE_ON_AC/BAT
    
        # Everything else TLP is good at:
        USB_AUTOSUSPEND = 1;
        USB_EXCLUDE_AUDIO = 1;
    
        SATA_LINKPWR_ON_AC = "med_power_with_dipm";
        SATA_LINKPWR_ON_BAT = "min_power";
    
        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersupersave";
    
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";
    
        RUNTIME_PM_ON_AC = "on";
        RUNTIME_PM_ON_BAT = "auto";

        DISK_IDLE_SECS_ON_AC = 0;
        DISK_IDLE_SECS_ON_BAT = 2;

        SOUND_POWER_SAVE_ON_AC = 0;
        SOUND_POWER_SAVE_ON_BAT = 1;
      };
    };
  };
}
