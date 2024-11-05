{ config, pkgs, lib, ... }:

{

  # Auto unlock gnome keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  # Remove default packages from GNOME
  environment.gnome.excludePackages = with  pkgs; [
    baobab      # disk usage analyzer
    cheese      # photo booth
    eog         # image viewer
    epiphany    # web browser
    #gedit       # text editor
    simple-scan # document scanner
    totem       # video player
    yelp        # help viewer
    evince      # document viewer
    file-roller # archive manager
    geary       # email client
    seahorse    # password manager
    gnome-contacts
    gnome-weather
    gnome-maps
    gnome-music
    gnome-software
    gnome-extension-manager
    gnome-shell-extensions
    gnome-photos
    gnome-connections
    snapshot
    gnome-logs
    gnome-system-monitor
    gnome-calculator
    gnome-tour
  ];

  environment.systemPackages = with pkgs; [
    #Gnome tweak tools
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.gsconnect
    gnomeExtensions.hot-edge
    gnomeExtensions.alphabetical-app-grid
  ];

}
