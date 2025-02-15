{ config, lib, pkgs, ... }: {
    boot.initrd.kernelModules = [ "amdgpu" ];
    hardware.graphics.enable32Bit = true; # For 32 bit applications
}