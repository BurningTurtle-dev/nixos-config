
.PHONY: build upgrade garbage all

build:
	clear
	git add .
	@[ -n "$(HARDWARE)" ] || { echo "HARDWARE env var not set. Canceling build!!!"; exit 1; }
	nixos-rebuild switch --flake .#$(HARDWARE)

build-fallback:
	clear
	git add .
	@[ -n "$(HARDWARE)-fallback" ] || { echo "HARDWARE env var not set. Canceling build!!!"; exit 1; }
	nixos-rebuild switch --flake .#$(HARDWARE)-fallback


upgrade:
	nix flake update
	$(MAKE) build

forecast:
	nix-forecast -c "/etc/nixos#nixosConfigurations.hp" -b https://cache.nixos.org -b https://nix-community.cachix.org

garbage:
	nix-collect-garbage -d

all: upgrade garbage
