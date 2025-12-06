{ ... }: {
    imports = [
        ../../hardware-configuration.nix

        ./connectivity
        ./virtualization
        ./bootloader.nix
        ./k3s.nix
        ./openssh.nix
    ];
}