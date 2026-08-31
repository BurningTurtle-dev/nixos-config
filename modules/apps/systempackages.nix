{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    htop
    git
    tldr
    mc
    p7zip
    killall
    tree
    home-manager
    age
    sops
    age-plugin-yubikey
    yazi
    nix-forecast
  ];
}

