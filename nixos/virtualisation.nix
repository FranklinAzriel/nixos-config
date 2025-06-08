{ config, lib, pkgs, ... }: {
    virtualisation.libvirtd = {
        enable = true;
        nss = {
            enable = true;
            enableGuest = true;
        };
        qemu = {
            package = pkgs.qemu_full;
            runAsRoot = true;
            swtpm.enable = true;
            ovmf.enable = true;
            vhostUserPackages = with pkgs; [ virtiofsd ];
        };
    };

    environment.systemPackages = with pkgs; [
        virt-manager
    ];
    
    virtualisation.vmware.host.enable = true;

}
