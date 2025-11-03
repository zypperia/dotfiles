{ config, pkgs, ... }:

{
  home.username = "gemma";
  home.homeDirectory = "/home/gemma";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # dev ed
    zed-editor

    # dev tools
    qemu
    gnumake
    cmake
    gcc

    # sys tools
    foot
    
    
  ];

  home.sessionVariables = {
    EDITOR = "hx";
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
  
  programs.home-manager.enable = true;
}
