{ ... }: {
    imports = [
        ./bluetooth.nix
        ./networkmanager.nix
        ./tailscale.nix
    ];
}