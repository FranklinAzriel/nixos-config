{ config, lib, pkgs, ... }: {
    networking.hostName = "Holy-Nix"; # Define your hostname.

    networking.networkmanager.enable = true; # Enable NetworkManager for managing network connections.
    networking.networkmanager.wifi.backend = "iwd"; # Use iwd for Wi-Fi backend.
    
    hardware.bluetooth = {
        enable = true; # enables support for Bluetooth
        settings.General.Experimental = true;
    };

    # Enable MPRIS proxy for media control.
    systemd.user.services.mpris-proxy = {
        description = "Mpris proxy";
        after = [ "network.target" "sound.target" ];
        wantedBy = [ "default.target" ];
        serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };

    services.tailscale.enable = true; # Enable Tailscale.
}
