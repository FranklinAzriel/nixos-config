{ ... }: {
    imports = [
        ../../hardware-configuration.nix

        ./connectivity
        ./bootloader.nix
        ./openssh.nix
    ];
}