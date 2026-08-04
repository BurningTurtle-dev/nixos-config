# Standalone flake for the sway + waybar home-manager setup in ./home.nix.
#
# USAGE:
#   1. Put this file and home.nix in the same directory (e.g. ~/dotfiles/).
#   2. Edit the `username`, `homeDirectory`, and `system` values below.
#   3. Build/activate:
#        nix run home-manager -- switch --flake .#yourusername
#      or, once you have home-manager installed:
#        home-manager switch --flake .#yourusername
#
# This assumes you're on NixOS (or another distro) with Wayland/sway support
# available system-side, since `wayland.windowManager.sway` in home.nix
# expects to run under a Wayland session. If you're on non-NixOS Linux,
# make sure a login manager / seat setup (e.g. greetd, or launching sway
# from a tty) is already in place outside of this flake.

{
  description = "Home-manager config: sway + waybar";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      # EDIT THESE:
      username = "burningturtle";
      homeDirectory = "/home/${username}";
      system = "x86_64-linux"; # or "aarch64-linux"

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true; # mullvad-vpn etc. may be unfree/unfree-adjacent
      };
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          {
            home.username = username;
            home.homeDirectory = homeDirectory;

            # Pin this to whatever nixpkgs release/home-manager version
            # you're actually using, then don't change it casually --
            # see the home-manager docs on `home.stateVersion`.
            home.stateVersion = "24.05";
          }

          ./home.nix
        ];
      };
    };
}
