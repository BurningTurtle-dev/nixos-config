
{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.programs.my-librewolf;
in {
  options.programs.my-librewolf = {
    enable = mkEnableOption "LibreWolf with custom extensions and settings";

    extensions = mkOption {
      type = types.listOf types.package;
      default = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        noscript
        bitwarden
        consent-o-matic
        darkreader
        libredirect
      ];
      description = "List of LibreWolf extensions (from NUR)";
    };

    extraSettings = mkOption {
      type = types.attrs;
      default = {};
      description = "Extra about:config settings";
    };
  };

  config = mkIf cfg.enable {
    programs.librewolf = {
      enable = true;
      globalExtensions = cfg.extensions;
      settings = {
        "browser.startup.homepage" = "about:blank";
        "privacy.clearOnShutdown.cache" = true;
      } // cfg.extraSettings;
    };
  };
}
