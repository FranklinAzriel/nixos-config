{ config, lib, pkgs, ... }: {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.FranklinAzriel = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" ]; # Enable ‘sudo’ for the user.
    };

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
}
