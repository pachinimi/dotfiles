{ pkgs, ... }:

{

  # Enable the GNOME Desktop Environment.
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      excludePackages = [ pkgs.xterm ];
    };
  };
  environment.gnome.excludePackages = with pkgs; [
    orca
    gnome-clocks
    loupe
    file-roller
    evince
    geary
    gnome-disk-utility
    gnome-backgrounds
    gnome-bluetooth
    gnome-color-manager
    gnome-tour
    baobab
    epiphany
    gnome-text-editor
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-weather
    gnome-connections
    gnome-shell-extensions
    simple-scan
    seahorse
    snapshot
    totem
    gnome-software
  ];

  environment.systemPackages = with pkgs.gnomeExtensions; [
    alphabetical-app-grid
    appindicator
    just-perfection
    rounded-window-corners-reborn
  ];

  services.udev.packages = [ pkgs.gnome-settings-daemon ];

}
