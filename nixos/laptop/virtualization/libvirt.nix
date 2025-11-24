{ pkgs, ... }: {
     # Enable libvirt daemon
     virtualisation.libvirtd = {
        enable = true;
        nss = {
            enable = true; # 
            enableGuest = true;
        };
        qemu = {
            package = pkgs.qemu_kvm;
            runAsRoot = true;
            swtpm.enable = true;
            vhostUserPackages = with pkgs; [ virtiofsd ];
        };
    };

    environment.systemPackages = with pkgs; [
        virt-manager # View and manage virtual machines
    ];

    virtualisation.spiceUSBRedirection.enable = true;
}
