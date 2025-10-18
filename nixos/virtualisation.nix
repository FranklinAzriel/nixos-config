{ config, lib, pkgs, ... }: {

    virtualisation.libvirtd = {
        enable = true; # Enable libvirt daemon
        nss = {
            enable = true; # 
            enableGuest = true;
        };
        #qemu = {
            #package = pkgs.qemu_full;
            #runAsRoot = true;
            #swtpm.enable = true;
            #vhostUserPackages = with pkgs; [ virtiofsd ];
        #};
    };

    environment.systemPackages = with pkgs; [
        virt-manager # View and manage virtual machines
    ];
    
    #virtualisation.vmware.host.enable = true; # Enable VMware host support
}
