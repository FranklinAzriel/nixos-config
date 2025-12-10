{ ... }: {
    imports = [
        ./connectivity
        #./bootloader.nix
        ./k3s.nix
    ];
}