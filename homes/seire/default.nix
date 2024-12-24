{
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    initExtra = "btop";
  };

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      update_ms = 500;
    };
  };

  home = {
    username = "seire";
    homeDirectory = "/var/seire";

    stateVersion = "24.05";
  };
}
