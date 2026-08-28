
{ ... }:

{
  programs.alacritty = {
    enable = true;

    theme = "tokyo_night";
    
    settings = {
      window = {
        decorations = "None";
        dynamic_padding = true;
        opacity = 0.7;
        dynamic_title = true;
      };
      
      general = {
        live_config_reload = true;
      };
    };
  };
}
