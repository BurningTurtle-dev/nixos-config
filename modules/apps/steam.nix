
{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];

    remotePlay.openFirewall = false;  # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = false; # Open ports for Source Dedicated Server hosting
  };

  programs.gamemode.enable = true;
}
