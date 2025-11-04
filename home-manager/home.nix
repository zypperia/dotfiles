{ config, pkgs, ... }:

{
  home.username = "gemma";
  home.homeDirectory = "/home/gemma";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # base
    librewolf
    foot
    alacritty
    kitty
    jetbrains-mono
    nerd-fonts.jetbrains-mono

    # dev ed
    zed-editor

    # dev tools
    qemu
    gnumake
    cmake
    gcc

    # lsp
    tree-sitter
    clang-tools
    gopls
    nil
    ruff

    # py
    uv
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    #xwayland.enable = false;
    systemd.enable = true;


    settings = {
      "$mod" = "SUPER";

      monitor = ",preferred,auto,auto";

      general = {
        gaps_in = 6;
        gaps_out = 12;
        border_size = 0;

        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
      };

    animations.enabled = false;

      env = [
        #"HYPRCURSOR_SIZE,24"
        #"HYPRCURSOR_THEME,Adwaita"
      ];

      /*exec-once = [
        "swaybg -i ~/downloads/output2.png"
        #"hyprctl setcursor adwaita-dark 24"
      ];*/

      bind = [
        "$mod, Q, exec, foot"
        "$mod, R, exec, fuzzel"
        "$mod, C, killactive"
        "$mod, M, exit"

        "$mod, V, togglefloating,"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit"

        ", PRINT, exec, hyprshot -m region"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        # Workspaces move
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      windowrulev2 = [
        "size = 1000 1000,floating:1"
      ];

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle";
        touchpad.natural_scroll = true;
      };
    };
  };

  # River compositor (standard minimal config)
  wayland.windowManager.river = {
    enable = true;
    settings = {
      set-repeat = "50 300";
      default-layout = "rivertile";
      #xcursor-theme = "Adwaita 24";
      focus-follows-cursor = "normal";
      spawn = [
        "rivertile -view-padding 4 -outer-padding 8"
      ];
      map.normal = {
        "Super Return" = "spawn foot";
        "Super D" = "spawn fuzzel";
        "Super Q" = "close";
        "Super E" = "exit";
        "Super F" = "toggle-fullscreen";
        # focus / swap
        "Super J" = "focus-view next";
        "Super K" = "focus-view previous";
        "Super+Shift J" = "swap next";
        "Super+Shift K" = "swap previous";
        # rivertile ratio adjust
        "Super H" = "send-layout-cmd rivertile 'main-ratio -0.05'";
        "Super L" = "send-layout-cmd rivertile 'main-ratio +0.05'";
        # workspaces 1..9
        "Super 1" = "set-focused-tags 1";
        "Super 2" = "set-focused-tags 2";
        "Super 3" = "set-focused-tags 4";
        "Super 4" = "set-focused-tags 8";
        "Super 5" = "set-focused-tags 16";
        "Super 6" = "set-focused-tags 32";
        "Super 7" = "set-focused-tags 64";
        "Super 8" = "set-focused-tags 128";
        "Super 9" = "set-focused-tags 256";
        "Super+Shift 1" = "set-view-tags 1";
        "Super+Shift 2" = "set-view-tags 2";
        "Super+Shift 3" = "set-view-tags 4";
        "Super+Shift 4" = "set-view-tags 8";
        "Super+Shift 5" = "set-view-tags 16";
        "Super+Shift 6" = "set-view-tags 32";
        "Super+Shift 7" = "set-view-tags 64";
        "Super+Shift 8" = "set-view-tags 128";
        "Super+Shift 9" = "set-view-tags 256";
        # screenshots
        #"Super Print" = "spawn sh -lc '${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" ~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png'";
      };
    };
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
        padding = {
          top = 1;
        };
      };
      display = {
        separator = "\t";
      };
      modules = [
        "break"
        "title"
        {
          type = "os";
          key = "os";
          keyColor = "red";
        }
        {
          type = "command";
          key = "bios";
          text = "echo \"$(cat /sys/class/dmi/id/bios_vendor) => $(cat /sys/class/dmi/id/bios_version)\"";
          keyColor = "green";
        }
        {
          type = "host";
          key = "host";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = "pkgs";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = "shell";
          keyColor = "magenta";
        }
        {
          type = "colors";
          paddingLeft = 6;
          symbol = "circle";
        }
        "break"
      ];
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "Zypperia";
      user.email = "q@q.xyz";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "ayu_dark";
    };
  };
  
  fonts.fontconfig.enable = true;
  programs = {
    home-manager.enable = true;
    fuzzel.enable = true;
  };
}
