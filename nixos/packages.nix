{ config, lib, pkgs, ... }: {
    environment.systemPackages = [
        pkgs.file
        pkgs.cachix
    ];
}