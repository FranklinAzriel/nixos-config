{ config, lib, pkgs, ... }: {
    # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    environment.systemPackages = with pkgs; [
      kdePackages.plasma-vault
      kdePackages.qtsvg
      
      # Cursors
      bibata-cursors
    ];
}
