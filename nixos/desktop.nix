{ config, lib, pkgs, ... }: {
    # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Enable sound.
    services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        jack.enable = true;
        alsa.support32Bit = true;
    };
    
    services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
      "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
      };
    };

    environment.systemPackages = with pkgs; [
      kdePackages.plasma-vault
    ];
}
