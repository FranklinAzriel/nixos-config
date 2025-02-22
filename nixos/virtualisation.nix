{ config, lib, pkgs, ... }: {
    virtualisation.libvirtd = {
        enable = true;
        qemu = {
            package = pkgs.qemu_kvm;
            runAsRoot = true;
            swtpm.enable = true;
            ovmf.enable = true;
        };
    };

    environment.systemPackages = with pkgs; [
        virt-manager
    ];

    #virtualisation.vmware.host.enable = true;
}