{ config, lib, pkgs, ... }: {

    boot.initrd.luks.devices.nixos = {
        device = "/dev/disk/by-uuid/e7d3419b-fc87-484f-ae9d-ea331d61c4b8";
        allowDiscards = true;
    };
}