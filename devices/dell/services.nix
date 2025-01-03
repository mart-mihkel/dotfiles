{
  services = {
    pcscd.enable = true;

    auto-cpufreq.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    greetd = {
      enable = true;
      settings = {
        terminal = { vt = 1; };

        initial_session = {
          command = "hyprland";
          user = "kubujuss";
        };

        default_session = {
          command = "bash";
          user = "kubujuss";
        };
      };
    };
  };
}
