{ pkgs, ... }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/fastfetch.nix
    ./modules/bash.nix
    ./modules/tmux.nix
    ./modules/git.nix

    ./modules/nvim
    ./modules/hypr
    ./modules/rofi
    ./modules/eww
  ];

  programs.home-manager.enable = true;

  home = {
    username = "kubujuss";
    homeDirectory = "/home/kubujuss";

    packages = with pkgs; [ 
      intel-undervolt
      cloudflared
      qdigidoc
      firefox
      slack
      zoom
      ccid
    ];

    stateVersion = "24.05";
  };
}
