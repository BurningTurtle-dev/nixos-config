build:
	clear
	nixos-rebuild switch --flake .#nixos

upgrade:
	nix flake update
	make build

garbage:
	nix-collect-garbage -d

all:
	make upgrade
	make garbage
