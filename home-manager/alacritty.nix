
{ ... }:

{
  programs.alacritty = {
    enable = true;

    #theme = "gotham";
    
    settings = {
      window = {
        decorations = "None";
        dynamic_padding = true;
        opacity = 0.5;
        dynamic_title = true;
      };
      
      general = {
        live_config_reload = true;
      };
    };
  };
}
