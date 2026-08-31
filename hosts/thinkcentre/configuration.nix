
{ ... }:

{
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
