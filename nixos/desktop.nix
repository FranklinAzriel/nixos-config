{ config, lib, pkgs, ... }: {
    # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Enable sound.
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

    environment.systemPackages = with pkgs; [
      kdePackages.plasma-vault

    ];
}
