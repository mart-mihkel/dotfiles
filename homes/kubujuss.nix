{ pkgs, ... }:

{
  imports = [
    ./modules/fastfetch.nix
    ./modules/bash.nix
    ./modules/tmux.nix
    ./modules/git.nix

    ./modules/nvim
  ];

  programs.home-manager.enable = true;

  home = {
    username = "kubujuss";
    homeDirectory = "/home/kubujuss";

    packages = with pkgs; [ wol ];

    stateVersion = "24.05";
  };
}
