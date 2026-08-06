{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = { url = "github:nix-community/nixvim"; };
  };

  outputs = { self, nixpkgs, home-manager, nur, nixvim, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        hp = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/hp/configuration.nix
            home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = [ nur.overlays.default ];
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.burningturtle = {
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
