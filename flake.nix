
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = { url = "github:nix-community/nixvim"; };
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, sops-nix, stylix, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        thinkcentre = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/thinkcentre/configuration.nix
	    sops-nix.nixosModules.sops
            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = [ ];
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.user = {
                imports = [
                  ./home.nix
                  nixvim.homeModules.nixvim
                ];
              };
            }
          ];
        };
      };
    };
}
