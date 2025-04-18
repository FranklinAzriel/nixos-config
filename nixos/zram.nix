{ config, lib, pkgs, ... }: {
    services.zram-generator = {
        enable = true;
        settings.zram0 = {
            compression-algorithm = "zstd lz4 (type=huge)";
            zram-size = "ram";
            swap-priority = 32767;
            fs-type = "swap";
        };
    };
}