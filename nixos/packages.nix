{ config, lib, pkgs, ... }: {
    environment.systemPackages = [
        pkgs.file
        pkgs.pciutils
        pkgs.cachix

        # Archiving tools
        pkgs.libarchive
        pkgs.zip
        pkgs.unzip

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