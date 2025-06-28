{ config, lib, pkgs, ... }: {

    services.zram-generator = {
        enable = true; # Enable zram-generator service
        settings.zram0 = {
            compression-algorithm = "zstd lz4 (type=huge)";
            zram-size = "ram * 3 / 4"; # Use 75% of RAM for zram
            swap-priority = 32767; # Set high priority for zram before other swap devices.
            fs-type = "swap";
        };
    };
}