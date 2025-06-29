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
        pkgs.autoconf
        pkgs.automake
        pkgs.libtool
        pkgs.gnum4
        pkgs.pkg-config

        # 
        pkgs.glib
        pkgs.glibc
    
    ];
}