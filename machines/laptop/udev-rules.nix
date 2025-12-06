{ pkgs, ...}: 
let
    cachyos-udev-rules = pkgs.callPackage ../../pkgs/cachyos-settings-udev-rules.nix {};
in

{
    services.udev.packages = [
        cachyos-udev-rules
    ];
      
}