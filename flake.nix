
{
  inputs = {
    nixpkgs.url = "git+https://git.burningturtle.win/burningturtle/nixpkgs?ref=nixos-unstable&shallow=1";
    nixpkgs-fallback.url = "github:nixos/nixpkgs/nixos-unstable";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = { url = "github:nix-community/nixvim"; };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-fallback, home-manager, nur, nixvim, nix-flatpak, sops-nix, nix-vscode-extensions, stylix, ... }:
    let
      system = "x86_64-linux";

      commonModules = [
        sops-nix.nixosModules.sops
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [ nur.overlays.default ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.burningturtle = {
            imports = [
              ./home.nix
              nixvim.homeModules.nixvim
	      nix-flatpak.homeManagerModules.nix-flatpak
            ];
          };
        }
      ];

      mkHost = { hostConfig, extraModules ? [ ], nixpkgsSource ? nixpkgs }:
        nixpkgsSource.lib.nixosSystem {
          inherit system;
          modules = commonModules ++ [ hostConfig ] ++ extraModules;
        };

    in {
      nixosConfigurations = {
        hp = mkHost {
          hostConfig = ./hosts/hp/configuration.nix;
        };
        hp-fallback = mkHost {
          hostConfig = ./hosts/hp/configuration.nix;
          nixpkgsSource = nixpkgs-fallback;
        };

      };
    };
}
