{ config, lib, pkgs, ... }: {
    networking.hostName = "Holy-Nix"; # Define your hostname.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
}
