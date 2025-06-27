{ config, lib, pkgs, ... }: {
    environment.systemPackages = [
        pkgs.file
        pkgs.pciutils
        pkgs.cachix

        # Build tools
        pkgs.gcc
        pkgs.binutils
        pkgs.cmake
        pkgs.gnumake
        pkgs.clang

        # 
        pkgs.glib
        pkgs.glibc
    
    ];
}