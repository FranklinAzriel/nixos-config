{ pkgs, ... }: {
    # Needed packages for KDE Plasma 6.
    environment.systemPackages = with pkgs; [
    
        # KDE Plasma basic packages
        kdePackages.plasma-desktop
        kdePackages.plasma-vault
        kdePackages.qtsvg
        kdePackages.filelight
        kdePackages.kolourpaint
        kdePackages.kteatime

        # KDE Plasma partition tools
        kdePackages.partitionmanager
        kdiskmark

        # Virtual desktops
        kara


    ];
}