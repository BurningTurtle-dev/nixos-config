
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    bluetuith
    pavucontrol
    cmus

    (pkgs.writeShellScriptBin "musicsetup" ''
      #!${pkgs.fish}/bin/fish
      
      alacritty -e bluetuith &
      pavucontrol &
      disown;
      cmus
    '')
  ];
}
