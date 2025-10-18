{ pkgs, ... }: {
    networking.networkmanager.enable = true; # Enable NetworkManager for managing network connections.
    networking.networkmanager.wifi.backend = "iwd"; # Use iwd for Wi-Fi backend.
}
