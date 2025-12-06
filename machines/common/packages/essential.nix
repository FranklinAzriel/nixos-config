{ pkgs, ... }: {
    environment.systemPackages = [
        pkgs.file
        
        pkgs.pciutils
        pkgs.usbutils

        pkgs.cachix

        pkgs.nh

        pkgs.openssl
    ];
}