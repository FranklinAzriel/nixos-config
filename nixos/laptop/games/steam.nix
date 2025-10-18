{ pkgs, ... }: {
    # Enable and configure Steam.
    programs.steam = {
        enable = true; # Enable Steam
        gamescopeSession.enable = true; 
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
        extraCompatPackages = [
            pkgs.proton-ge-bin
        ];
    };
    
}