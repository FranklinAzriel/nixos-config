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

    boot.binfmt.emulatedSystems = [
	"riscv64-linux"
    ];

    environment.systemPackages = with pkgs; [
        virt-manager
    ];
}
