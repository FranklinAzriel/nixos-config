{ pkgs, ... }: {
    environment.systemPackages = [
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
        pkgs.glib
        pkgs.glibc
    ];
}