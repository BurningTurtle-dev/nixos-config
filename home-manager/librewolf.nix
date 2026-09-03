
{ pkgs, ... }:

{
  programs.librewolf = {
    enable = true;

    policies = {
      # Updates & Background Services
      AppAutoUpdate                 = false;
      BackgroundAppUpdate           = false;
  
      # UI and Behavior
      DisplayMenuBar                = "never";
      DontCheckDefaultBrowser       = true;
      HardwareAcceleration          = true;
      OfferToSaveLogins             = false;
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        noscript
        bitwarden
        consent-o-matic
        darkreader
        libredirect
      ];

      settings = {
        #"browser.startup.homepage" = "about:home";
        #"browser.search.defaultenginename" = "DuckDuckGo";
        #"browser.newtabpage.enabled" = true;
        #"signon.rememberSignons" = true;
        #"browser.contentblocking.category" = "strict";
        #"extensions.pocket.enabled" = false;
        "browser.toolbars.bookmarks.visibility" = "newtab";
      };

      search = {
        force = true;
        default = "ddg";
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "https://nixos.org/favicon.ico";
            definedAliases = [ "@np" ];
          };
          
          "MyNixOS" = {
            urls = [{
              template = "https://mynixos.com/search";
              params = [
                { name = "?q"; value = "{searchTerms}"; }
              ];
            }];
            icon = "https://mynixos.com/favicon.ico";
            definedAliases = [ "@mn" ];
          };


          "NixOS Wiki" = {
            urls = [
              {
                template = "https://wiki.nixos.org/w/index.php";
                params = [
                  { name = "search"; value = "{searchTerms}"; }
                ];
              }
            ];
            icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nw" ];
          };

          "Arch Wiki" = {
            urls = [{
              template = "https://wiki.archlinux.org/index.php";
              params = [
                { name = "search"; value = "{searchTerms}"; }
              ];
            }];
            icon = "https://wiki.archlinux.org/favicon.ico";
            definedAliases = [ "@aw" ];
          };
        };
      };
    };
  };
}
