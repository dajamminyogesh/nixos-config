{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #hypridle
    #hyprlock
    hyprpolkitagent
    kitty
    grimblast #screenshot util
  ];
  # start ssh agent on login, this is required for local builds
  programs.ssh.startAgent = true;

  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  programs.hyprlock.enable = true;
  programs.uwsm.waylandCompositors = {
    hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.xautolock.enable = true;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.lightdm.enable = false;
  # autolock
  services.hypridle.enable = true;
  # kernel packages
  hardware.nvidia.open = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;
  # boot.kernelPackages = pkgs.linuxPackages_6_6;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'uwsm start hyprland-uwsm.desktop'";
        user = "greeter";
      };
    };
  };
}
