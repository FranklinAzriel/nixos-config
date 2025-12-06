{ ... }: {
    boot.kernelParams = [
        "nr_hugepages=1"
    ];

    fileSystems."/dev/hugepages" = {
        device = "hugetlbfs";
        fsType = "hugetlbfs";
        options = [ "mode=1770" "gid=100" ];
    };

}