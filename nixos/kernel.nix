{ config, lib, pkgs, ... }: {

    boot.kernelPackages = pkgs.linuxPackages; # Use the default kernel packages

    # Copyright (C) 2025 CachyOS

    # This program is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.

    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with this program.  If not, see <http://www.gnu.org/licenses/>.
    services.udev.extraRules = ''
        TEST!="/dev/zram0", GOTO="zram_end"

        # When used with ZRAM, it is better to prefer page out only anonymous pages,
        # because it ensures that they do not go out of memory, but will be just
        # compressed. If we do frequent flushing of file pages, that increases the
        # percentage of page cache misses, which in the long term gives additional
        # cycles to re-read the same data from disk that was previously in page cache.
        # This is the reason why it is recommended to use high values from 100 to keep
        # the page cache as hermetic as possible, because otherwise it is "expensive"
        # to read data from disk again. At the same time, uncompressing pages from ZRAM
        # is not as expensive and is usually very fast on modern CPUs.
        SYSCTL{vm.swappiness}="150"

        LABEL="zram_end"


        KERNEL=="rtc0", GROUP="audio"
        KERNEL=="hpet", GROUP="audio"

        # HDD
        ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="1", \
            ATTR{queue/scheduler}="bfq"

        # SSD
        ACTION=="add|change", KERNEL=="sd[a-z]*|mmcblk[0-9]*", ATTR{queue/rotational}=="0", \
            ATTR{queue/scheduler}="mq-deadline"

        # NVMe SSD
        ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/rotational}=="0", \
            ATTR{queue/scheduler}="none"

        DEVPATH=="/devices/virtual/misc/cpu_dma_latency", OWNER="root", GROUP="audio", MODE="0660"
        
    '';
}