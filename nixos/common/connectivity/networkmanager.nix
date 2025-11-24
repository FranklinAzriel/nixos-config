{ pkgs, ... }: {
    networking.networkmanager = {
        enable = true; # Enable NetworkManager for managing network connections.
        wifi.backend = "iwd"; # Use iwd for Wi-Fi backend.
    };
    services.resolved = {
        enable = true;
    };
}
