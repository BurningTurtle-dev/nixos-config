
{ lib, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        decorations = "None";
        dynamic_padding = true;
        opacity = lib.mkForce 0.7;
        dynamic_title = true;
      };
      
      general = {
        live_config_reload = true;
      };
    };
  };
}
