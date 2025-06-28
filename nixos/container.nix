{ config, lib, pkgs, ... }: {

    virtualisation.docker.enable = true; # Enable Docker support
    environment.systemPackages = [ pkgs.distrobox ]; # Distrobox for container management
}