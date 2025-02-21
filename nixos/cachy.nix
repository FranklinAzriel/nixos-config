{ config, lib, pkgs, ... }: {

  boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;
  #services.scx.enable = true; # by default uses scx_rustland scheduler
}