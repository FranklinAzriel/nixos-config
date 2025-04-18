{ config, lib, pkgs, ... }: {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.FranklinAzriel = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" "docker" ];
    };
}
