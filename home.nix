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

  # Example: manage a program's config declaratively
  # programs.git = {
  #   enable = true;
  #   userName = "BurningTurtle";
  #   userEmail = "you@example.com";
  # };
}
