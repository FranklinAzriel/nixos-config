{ config, lib, pkgs, ... }: {
    networking.hostName = "Holy-Nix"; # Define your hostname.

    networking.networkmanager.enable = true;
    networking.networkmanager.wifi.backend = "iwd";
    
    hardware.bluetooth = {
        enable = true; # enables support for Bluetooth
        settings.General.Experimental = true;
    };

    systemd.user.services.mpris-proxy = {
        description = "Mpris proxy";
        after = [ "network.target" "sound.target" ];
        wantedBy = [ "default.target" ];
        serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };

    services.tailscale.enable = true;
}
