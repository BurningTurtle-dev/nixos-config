
.PHONY: build upgrade garbage all

build:
	clear
	git add .
	@[ -n "$(HARDWARE)" ] || { echo "HARDWARE env var not set. Canceling build!!!"; exit 1; }
	nixos-rebuild switch --flake .#$(HARDWARE)

upgrade:
	nix flake update
	$(MAKE) build

garbage:
	nix-collect-garbage -d

all: upgrade garbage
