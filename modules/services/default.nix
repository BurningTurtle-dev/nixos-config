
{ ... }:

{
  imports = [
    ./cups.nix
    ./sound.nix
    ./displaymanager.nix
    ./other.nix
    ./bluetooth.nix
    ./docker.nix
    ./networkmanager/default.nix
    ./flatpak.nix
    ./udev.nix
    ./powermanagement.nix
  ];
}
