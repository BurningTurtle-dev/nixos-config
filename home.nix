
{ config, ... }:

{
  imports = [
    home-manager/default.nix
    ./options.nix
  ];

  home.sessionVariables = {
    XDG_DATA_DIRS = "/var/lib/flatpak/exports/share:${config.home.profileDirectory}/share:$XDG_DATA_DIRS";
  };

  home.username = "user";
  home.homeDirectory = "/home/user";

  # This should match the NixOS state version you started with,
  # and generally shouldn't be bumped casually - same rule as system.stateVersion.
  home.stateVersion = "26.05";

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "BurningTurtle";
        email = "git@burningturtle.win";
      };
    };
  };
}
