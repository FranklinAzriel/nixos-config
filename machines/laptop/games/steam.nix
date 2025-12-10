{ pkgs, ... }: {
    # Enable and configure Steam.
    programs.steam = {
        enable = true; # Enable Steam
        gamescopeSession.enable = true; 
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
        extraCompatPackages = [
            pkgs.vkd3d-proton
            #pkgs.proton-cachyos_x86_64_v3
            pkgs.proton-ge-bin
        ];
        extraPackages = [
            pkgs.bibata-cursors
        ];
    };
    
}