{ config, pkgs, ... }:

{
  home.username = "burningturtle";
  home.homeDirectory = "/home/burningturtle";

  # This should match the NixOS state version you started with,
  # and generally shouldn't be bumped casually - same rule as system.stateVersion.
  home.stateVersion = "26.05";

  # Packages you want available just for this user (as opposed to
  # environment.systemPackages, which is system-wide)
  home.packages = with pkgs; [
    ripgrep
    fd
  ];

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  # Fish shell config (aliases, greeting, etc.)
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -la";
      gs = "git status";
    };

    shellInit = ''
      set -g fish_greeting ""
    '';

    # interactiveShellInit = ''
    #   # anything you'd normally put in config.fish
    # '';
  };

   programs.git = {
     enable = true;
     userName = "BurningTurtle";
     userEmail = "git@burningturtle.win";
   };

   programs.librewolf = {
    enable = true;
    # Enable WebGL, cookies and history
    settings = {
      "privacy.clearOnShutdown.history" = false;
    };
  };

  home.file.".config/sway" = {
     source = ./dotconfigs/sway;
     recursive = true;
   };
}
