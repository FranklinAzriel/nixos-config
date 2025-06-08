{ config, lib, pkgs, ... }: {

    boot.kernelPackages = pkgs.linuxPackages;
    
    boot.extraModprobeConfig = ''
        options kvm_amd nested=1

        options rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y
        options rtw89pci disable_aspm_l1=y disable_aspm_l1ss=y
        options rtw89_core disable_ps_mode=y
        options rtw89core disable_ps_mode=y
    '';

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