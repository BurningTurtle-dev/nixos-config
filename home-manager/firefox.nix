{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      # Updates & Background Services
      AppAutoUpdate                 = false;
      BackgroundAppUpdate           = false;
  
      # Feature Disabling
      DisableBuiltinPDFViewer       = true;
      DisableFirefoxStudies         = true;
      DisableFirefoxAccounts        = true;
      DisableFirefoxScreenshots     = true;
      DisableForgetButton           = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport          = true;
      DisableProfileRefresh         = true;
      DisableSetDesktopBackground   = true;
      DisablePocket                 = true;
      DisableTelemetry              = true;
      DisableFormHistory            = true;
      DisablePasswordReveal         = true;
  
      # Access Restrictions
      BlockAboutConfig              = false;
      BlockAboutProfiles            = false;
      BlockAboutSupport             = true;
  
      # UI and Behavior
      DisplayMenuBar                = "never";
      DontCheckDefaultBrowser       = true;
      HardwareAcceleration          = true;
      OfferToSaveLogins             = true;
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        darkreader
      ];

      settings = {
        "browser.startup.homepage" = "about:home";
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.newtabpage.enabled" = true;
        "signon.rememberSignons" = true;
        "browser.contentblocking.category" = "strict";
        "extensions.pocket.enabled" = false;
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
        };
      };
    };
  };
}
