
{ lib, ... }:

{
  options.my = {
    sway = {
      eDP_scale = lib.mkOption {
        type = lib.types.str;
	default = "1.0";
	description = "Sets the scaling of the eDP-1 display in Sway";
      };
    };
  };
}
