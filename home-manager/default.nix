
{ ... }:

{
  imports = [
    #./rofi/rofi.nix
    #./custom_scripts/default.nix
    #./development/default.nix
    ./sway.nix
    ./alacritty.nix
    #./themes.nix
    #./userapps.nix
    ./librewolf.nix
    ./nixvim.nix
    #./tmux.nix
    #./flatpak.nix
    #./zathura.nix
    ./fish.nix
    #./codium.nix
    #./vscode_unfree.nix
    ./stylix.nix
    #./firefox.nix
  ];
}
