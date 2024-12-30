{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      general = {
        gaps_in = 8;
        gaps_out = 16;
        border_size = 1;

        "col.active_border" = "0xff000000";
        "col.inactive_border" = "0xffd8d8d8";
      };

      decoration = {
        rounding = 8;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        blur = {
          enabled = true;

          size = 12;
          passes = 1;
        };

        shadow = {
          enabled = false;
        };
      };

      animations = {
        animation = "global, 1, 4, default";
      };

      input = {
        kb_layout = "ee";
        repeat_rate = 32;
        repeat_delay = 256;
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      cursor = {
        inactive_timeout = 2;
      };

      misc = {
        disable_hyprland_logo = true;
      };

      monitor = ", preferred, auto, 1, mirror, eDP-1";

      windowrule = "opacity 0.9, Alacritty|Rofi";

      bind = [
        "SUPER SHIFT, S, exec, grim -g '$(slurp)' - | wl-copy"
        "SUPER SHIFT, R, exec, pkill rofi || rofi -show ssh"

        "SUPER, code:60, exec, pkill rofi || rofi -modi emoji -show emoji"
        "SUPER, R, exec, pkill rofi || rofi -show drun"
        "SUPER, Q, exec, alacritty"
        "SUPER, N, exec, hyprlock"

        "SUPER, V, togglefloating,"
        "SUPER, F, fullscreen,"
        "SUPER, C, killactive,"
        "SUPER, M, exit,"

        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"

        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"
        ", XF86AudioMute, exec, pamixer -t"

        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl s +5%"

        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"
      ];

      exec-once = [
        "gammastep -l 58.59:25.01 -t 6500:3500 -m wayland"
        "eww open bar-win"
        "hyprpaper"
        "hypridle"
        "hyprlock"
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      background = {
        monitor = "";
        path = "screenshot";
        color = "0x00ffffff";

        blur_passes = 2;
        blur_size = 4;
      };

      input-field = {
        monitor = "";
        size = "15%, 5%";
        outline_thickness = 1;

        font_family = "JetbrainsMono Nerd Font";
        font_color = "0xff000000";

        inner_color = "0xffffffff";
        outer_color = "0xff000000";

        fade_on_empty = true;
        rounding = 8;

        position = "0, -20";
        halign = "center";
        valign = "center";
      };
    };
  };

  services = {
    hypridle = {
      enable = true;

      settings = {
        listener = [
          {
            timeout = 300;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }

          {
            timeout = 360;
            on-timeout = "pidof hyprlock || hyprlock";
          }

          {
            timeout = 600;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };

    hyprpaper = {
      enable = true;

      settings = {
        preload = [ "..." ];
        wallpaper = ", ...";
      };
    };
  };

  home.packages = with pkgs; [ 
    brightnessctl
    noto-fonts
    nerdfonts
    gammastep
    slurp
    grim
  ];
}
