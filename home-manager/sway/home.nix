
{ config, pkgs, ... }:

let
  # Make wallpaper available in the Nix store
  wallpaper = pkgs.runCommand "wallpaper-1716822934568753" {} ''
    mkdir -p $out
    cp ${./../../wallpapers/1716822934568753.jpg} $out/wallpaper.jpg
  '';
in
{

  ###########################################################################
  ## Packages used by keybindings / autostart / scripts
  ###########################################################################
  home.packages = with pkgs; [
    # terminal / launcher / file manager
    alacritty
    rofi
    nemo-with-extensions


    # screenshots / clipboard
    grim
    slurp
    wl-clipboard
    cliphist

    # session / lock / logout
    wlogout

    # brightness / audio
    brightnessctl
    pavucontrol
    pulseaudio # provides pactl; swap for `pipewire` tooling if you use pipewire-pulse only

    # status bar helper deps
    jq

    # music / bluetooth audio
    cmus
    bluetuith

    # VPN / connectivity
    #mullvad-vpn
    kdePackages.kdeconnect-kde

    fish
  ];

  ###########################################################################
  ## Waybar
  ###########################################################################
  programs.waybar = {
    enable = true;
    systemd.enable = true; # we start it from sway's startup list instead, matching your original exec line

    settings = {
    mainBar = {
      height = 30;
      spacing = 4;
      margin-top = 10;
      margin-left = 10;
      margin-right = 10;
      margin-bottom = 0;

      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [
        "sway/language"
        "pulseaudio"
        "network"
        "backlight"
        "battery"
        "battery#bat2"
        "clock"
        "tray"
      ];

      "sway/language" = {
        format = "{short}";
      };

      "sway/workspaces" = {
        format = "{name}";
        all-outputs = false;
        disable-scroll = false;
      };

      "sway/window" = {
        format = "{title}";
        max-length = 60;
        tooltip = false;
        icon = true;
      };

      tray = {
        spacing = 5;
      };

      clock = {
        timezone = "Europe/Berlin";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };

      backlight = {
        format = "{percent}% {icon}";
        format-icons = [ "" ];
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-full = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = [ "" "" "" "" "" ];
      };

      "battery#bat2" = {
        bat = "BAT2";
      };

      network = {
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };

      pulseaudio = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
        on-click = "pavucontrol";
      };
    };
    };
  


    style = ''
      * {
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
          font-size: 13px;
          border-radius: 10px;
      }

      window#waybar {
          background-color: rgba(0, 0, 0, 0.5);
          color: #81f7ff;
          transition-property: background-color;
          transition-duration: .5s;
      }

      window#waybar.hidden {
          opacity: 0.3;
      }

      window#waybar.termite {
          background-color: #3F3F3F;
      }

      window#waybar.chromium {
          background-color: #000000;
          border: none;
      }

      button {
          box-shadow: inset 0 -3px transparent;
          border: none;
          border-radius: 0;
      }

      #workspaces button {
          padding: 0 5px;
          background-color: transparent;
          color: #81f7ff;
          border-radius: 10px;
      }

      #workspaces button.active {
          color: #1e1e2e;
          background-color: #81f7ff;
      }

      #workspaces button.focused {
          background-color: #81f7ff;
          color: #000000;
          box-shadow: inset 0 -3px #81f7ff;
      }

      #workspaces button.urgent {
          background-color: #eb4d4b;
      }

      #mode {
          background-color: #64727D;
          box-shadow: inset 0 -3px #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #window,
      #workspaces {
          margin: 0 4px;
      }

      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
          background-color: #81f7ff;
          color: #000000;
          margin: 0 4px;
          padding: 0 10px;
      }

      #battery {
          color: #81f7ff;
          background-color: #000000;
          padding: 0 10px;
      }

      #battery.charging, #battery.plugged {
          color: #ffffff;
          background-color: #26A65B;
          padding: 0 10px;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }

      #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: steps(12);
          animation-iteration-count: infinite;
          animation-direction: alternate;
          padding: 0 10px;
      }

      #power-profiles-daemon {
          padding-right: 15px;
      }

      #power-profiles-daemon.performance {
          background-color: #f53c3c;
          color: #ffffff;
      }

      #power-profiles-daemon.balanced {
          background-color: #2980b9;
          color: #ffffff;
      }

      #power-profiles-daemon.power-saver {
          background-color: #2ecc71;
          color: #000000;
      }

      label:focus {
          background-color: #000000;
      }

      #cpu {
          background-color: #81f7ff;
          color: #000000;
          padding: 0 10px;
      }

      #memory {
          color: #81f7ff;
          background-color: #000000;
          padding: 0 10px;
      }

      #disk {
          background-color: #964B00;
      }

      #backlight {
          background-color: #81f7ff;
          color: #000000;
          padding: 0 10px;
      }

      #network {
          color: #81f7ff;
          background-color: #000000;
      }

      #network.disconnected {
          background-color: #f53c3c;
      }

      #pulseaudio {
          background-color: #81f7ff;
          color: #000000;
          padding: 0 10px;
      }

      #wireplumber {
          background-color: #fff0f5;
          color: #000000;
      }

      #wireplumber.muted {
          background-color: #f53c3c;
      }

      #custom-media {
          background-color: #66cc99;
          color: #2a5c45;
          min-width: 100px;
      }

      #custom-media.custom-spotify {
          background-color: #66cc99;
      }

      #custom-media.custom-vlc {
          background-color: #ffa000;
      }

      #temperature {
          background-color: #f0932b;
      }

      #temperature.critical {
          background-color: #eb4d4b;
      }

      #tray {
          color: #81f7ff;
          background-color: #000000;
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }

      #idle_inhibitor {
          background-color: #2d3436;
      }

      #idle_inhibitor.activated {
          background-color: #ecf0f1;
          color: #2d3436;
      }

      #mpd {
          background-color: #66cc99;
          color: #2a5c45;
      }

      #mpd.disconnected {
          background-color: #f53c3c;
      }

      #mpd.stopped {
          background-color: #90b1b1;
      }

      #mpd.paused {
          background-color: #51a37a;
      }

      #language {
          background-color: #000000;
          color: #81f7ff;
          padding: 0 10px;
      }

      #keyboard-state {
          background: #97e1ad;
          color: #000000;
          padding: 0 0px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state > label {
          padding: 0 5px;
      }

      #keyboard-state > label.locked {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad.empty {
          background-color: transparent;
      }

      #privacy {
          padding: 0;
      }

      #privacy-item {
          padding: 0 5px;
          color: white;
      }

      #privacy-item.screenshare {
          background-color: #cf5700;
      }

      #privacy-item.audio-in {
          background-color: #1ca000;
      }

      #privacy-item.audio-out {
          background-color: #0069d4;
      }

      #custom-border {
          background-color: #81f7ff;
          color: #000000;
          padding: 0 10px;
      }
    '';
  };

  ###########################################################################
  ## Helper scripts (kept as executable files under ~/.config/sway/)
  ###########################################################################
  xdg.configFile."sway/toggle_edp.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      # Save sway outputs JSON into a variable
      outputs=$(swaymsg -t get_outputs | jq -r '.[] | select(.name=="eDP-1") | .active')

      if [ "$outputs" = "true" ]; then
          action="disable"
      else
          action="enable"
      fi

      swaymsg output eDP-1 "$action"

      exit 0
    '';
  };

  xdg.configFile."sway/set_drawingtablet_region.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      swaymsg input "1386:891:Wacom_One_by_Wacom_M_Pen" map_to_region $(slurp | sed 's/,/ /;s/x/ /')
    '';
  };


  ###########################################################################
  ## Sway
  ###########################################################################
  wayland.windowManager.sway = {
    enable = true;

    wrapperFeatures.gtk = true;

    package = pkgs.sway;

    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "rofi -show drun -show-icons";

      gaps = {
        inner = 10;
        outer = 7;
      };

      fonts = {
        names = [ "Roboto Condensed Bold" ];
        size = 1.0;
      };

      window = {
        border = 2;
        titlebar = false;
      };

      focus.wrapping = "workspace";

      colors = {
        focused = {
          border = "#81f7ff";
          background = "#81f7ff";
          text = "#81f7ff";
          indicator = "#81f7ff";
          childBorder = "#81f7ff";
        };
      };

      input = {
        "type:touchpad" = {
          tap = "enabled";
          tap_button_map = "lrm";
        };
        "1386:891:Wacom_One_by_Wacom_M_Pen" = {
          map_to_output = "DP-6";
        };
      };

      output = {
        "eDP-1" = {
          scale = config.my.sway.eDP_scale;
          position = "0,0";
        };
        "Lenovo Group Limited Y25-30 U3W0DZ8Y" = {
          mode = "1920x1080@60Hz";
          position = "1920,0";
        };
        "Acer Technologies ACER V243H LHG080184231" = {
          mode = "1920x1080@60Hz";
          position = "0,0";
        };
        "Acer Technologies XV240Y TLVEE0028525" = {
          mode = "1920x1080@60Hz";
          position = "3840,0";
        };
      };

      # Things started at sway launch, matching your original `exec` lines.
      # We drive waybar from here (with systemd.enable = false above) so it
      # keeps behaving exactly like your original setup.
      startup = [
#        { command = "waybar"; }
        { command = "cliphist wipe"; } # wipes history on startup
        { command = "wl-paste --type text --watch cliphist store"; }
        { command = "wl-paste --type image --watch cliphist store"; }
        { command = "kdeconnect-indicator"; }
      ];

      keybindings = let
        mod = "Mod4";
      in {
        # Custom
        "${mod}+t" = "exec librewolf";
        "${mod}+e" = "exec nemo";
        "${mod}+q" = "exec wlogout";
        "${mod}+c" = "exec cliphist list | rofi -dmenu --gtk-dark | cliphist decode | wl-copy";
        "${mod}+p" = "exec grim -g \"$(slurp -d)\" - | wl-copy";
        "${mod}+Shift+s" = "exec ~/.config/sway/toggle_edp.sh";
        "${mod}+Shift+p" = "exec ~/.config/sway/set_drawingtablet_region.sh";

        # Basics
        "${mod}+Return" = "exec alacritty";
        "${mod}+x" = "exec alacritty";
        "${mod}+Shift+c" = "kill";
        "${mod}+d" = "exec rofi -show drun -show-icons";
        "${mod}+Shift+q" = "reload";

        # Moving around (vim-style)
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        # Arrow keys
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        # Workspaces
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        # Layout
        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+space" = "exec swaymsg -q \"layout toggle split tabbed\"";
        "${mod}+Shift+f" = "floating toggle";
        "${mod}+f" = "focus mode_toggle";
        "${mod}+a" = "focus parent";

        # Scratchpad
        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";

        # Resize mode
        "${mod}+r" = "mode resize";

        # Media / brightness keys (--locked, so they work while the screen is locked)
        "--locked XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "--locked XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "--locked XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "--locked XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "--locked XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "--locked XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "Print" = "exec grim";
      };

      modes = {
        resize = {
          "h" = "resize shrink width 10px";
          "j" = "resize grow height 10px";
          "k" = "resize shrink height 10px";
          "l" = "resize grow width 10px";
          "Left" = "resize shrink width 10px";
          "Down" = "resize grow height 10px";
          "Up" = "resize shrink height 10px";
          "Right" = "resize grow width 10px";
          "Return" = "mode default";
          "Escape" = "mode default";
        };
      };

      bars = [ ]; # bar block is defined via extraConfig below (needs "mode invisible" + a shell status_command, which isn't cleanly expressible via home-manager's bar options)
    };

    # Anything without a clean structured home-manager option, transcribed
    # verbatim from your original config.
    extraConfig = ''
      ### Keyboard
      input * {
          xkb_layout "us(altgr-intl),de"
          xkb_options grp:rctrl_rshift_toggle
      }

      ### Wallpaper
      output * bg ${wallpaper}/wallpaper.jpg fill

      ### Title bars / borders (fine-grained bits not exposed as HM options)
      titlebar_border_thickness 0
      titlebar_padding 0
      for_window [app_id="^.*"] title_format " "
      for_window [class="^.*"] title_format " "

      smart_gaps off

      # Drag floating windows by holding down $mod and left mouse button.
      # Resize them with right mouse button + $mod ("normal" binding mode).
      floating_modifier Mod4 normal

      ### Status bar
      bar {
          position top
          mode invisible

          status_command while date +'%Y-%m-%d %X'; do sleep 1; done

          colors {
              statusline #ffffff
              background #00000000
              inactive_workspace #32323200 #32323200 #5c5c5c
          }
      }

      # Force workspace 1 to be the default
      workspace 1

      include /etc/sway/config.d/*
    '';
  };
}
