{ config, lib, pkgs, ... }: {
    services.zram-generator = {
        enable = true;
        settings.zram0 = {
            compression-algorithm = "zstd lz4 (type=huge)";
            zram-size = "ram * 3 / 4";
            swap-priority = 32767;
            fs-type = "swap";
        };
    };
}