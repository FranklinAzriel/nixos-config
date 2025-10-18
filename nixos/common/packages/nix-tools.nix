{ pkgs, ... }: {
    environment.systemPackages = [
        pkgs.cachix
        pkgs.nh
    ];
}