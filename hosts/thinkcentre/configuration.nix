
{ ... }:

{
  
  home-manager.users.user = {
    my.sway.eDP_scale = "1.0";
  };

  environment.variables = {
    HARDWARE = "thinkcentre";
  };


  imports =
    [
      ./hardware-configuration.nix
      ../../global_config.nix
    ];
  
  networking.hostName = "naspi"; # Define your hostname.
  }
