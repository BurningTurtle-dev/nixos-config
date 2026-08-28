
{ ... }:

{
  
  home-manager.users.burningturtle = {
    my.sway.eDP_scale = "1.0";
  };

  environment.variables = {
    HARDWARE = "hp";
  };


  imports =
    [
      ./hardware-configuration.nix
      ../../global_config.nix
    ];
  
  networking.hostName = "nixos"; # Define your hostname.
  }
