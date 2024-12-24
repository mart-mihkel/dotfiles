{ pkgs, ... }:

{
  imports = [
    ./fastfetch.nix
    ./nvim.nix
    ./bash.nix
    ./tmux.nix
    ./git.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "kubujuss";
    homeDirectory = "/home/kubujuss";

    packages = with pkgs; [ wol ];

    stateVersion = "24.05";
  };
}
