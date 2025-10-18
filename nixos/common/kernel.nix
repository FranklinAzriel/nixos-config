{ pkgs, ... }: {
    boot.kernelPackages = pkgs.linuxPackages; # Use the default kernel packages

}