{ ... } : {
    boot.kernel.sysctl = {
        "kernel.core_pattern" = "|/bin/false";
        "vm.swappiness" = 35;
        "vm.vfs_cache_pressure" = 50;

        "vm.dirty_background_bytes" = 67108864;
        "vm.dirty_bytes" = 268435456;

        "vm.page-cluster" = 0;

        "net.core.netdev_max_backlog" = 4096;
        "net.core.somaxconn" = 4096;

        "net.ipv4.tcp_fastopen" = 3;


        "vm.dirty_writeback_centisecs" = 1500;
        "kernel.kptr_restrict" = 2;
    };

}