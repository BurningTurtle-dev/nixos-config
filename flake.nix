
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
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, nixvim, nix-flatpak, sops-nix, nix-vscode-extensions, stylix, auto-cpufreq, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        hp = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/hp/configuration.nix
	    sops-nix.nixosModules.sops
            stylix.nixosModules.stylix
            auto-cpufreq.nixosModules.default

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
        };
      };
    };
}
