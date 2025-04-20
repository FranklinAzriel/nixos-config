{ config, lib, pkgs, ... }: {
    environment.systemPackages = [
        pkgs.file
        pkgs.pciutils
        pkgs.cachix
    ];
}