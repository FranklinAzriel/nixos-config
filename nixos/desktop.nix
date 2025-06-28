{ config, lib, pkgs, ... }: {

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the KDE Plasma 6 desktop environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Needed packages for KDE Plasma 6.
    environment.systemPackages = with pkgs; [
      # KDE Plasma basic packages
      kdePackages.plasma-vault
      kdePackages.qtsvg
      kdePackages.filelight
      kdePackages.kolourpaint
      kdePackages.kteatime

      # Virtual desktops
      pkgs.kara
      
      # Cursors
      bibata-cursors
    ];
}
