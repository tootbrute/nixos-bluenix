{ config, pkgs, lib, ... }:

{

  systemd.timers."update-flatpak" = {
  wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "1m";
      OnCalendar = "daily";
      Unit = "update-flatpak.service";
    };
  };

  systemd.services."update-flatpak" = {
    script = ''
      set -eu
      ${pkgs.flatpak}/bin/flatpak update --noninteractive --assumeyes
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    wantedBy = [ "multi-user.target" ]; # Ensure the service starts after rebuild
  };

}
