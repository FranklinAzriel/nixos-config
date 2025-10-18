{ pkgs, ... }: {
    environment.systemPackages = [
        # Archiving tools
        pkgs.libarchive
        pkgs.zip
        pkgs.unzip
        pkgs.zlib
    ];
}