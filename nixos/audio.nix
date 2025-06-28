{ config, lib, pkgs, ... }: {

    # Enable PipeWire and its components
    services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        jack.enable = true;
        alsa.support32Bit = true;
    };
    
    # NoiseTorch for noise cancellation
    programs.noisetorch.enable = true;

    # Bluetooth enhancements for PipeWire through WirePlumber
    services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
        };
    };
}