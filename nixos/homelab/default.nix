{ ... }: {
    imports = [
        ../../hardware-configuration.nix

        ./connectivity
        ./virtualization
        ./bootloader.nix
        ./openssh.nix
    ];
}