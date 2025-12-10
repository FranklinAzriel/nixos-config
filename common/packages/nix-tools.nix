{ pkgs, clan-core, ... }: {
    environment.systemPackages = [
        pkgs.cachix
        pkgs.nh
        clan-core.packages."x86_64-linux".clan-cli
    ];
}