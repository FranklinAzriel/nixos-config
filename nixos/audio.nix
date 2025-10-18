{ config, lib, pkgs, ... }: {

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # Enable PipeWire and its components
  services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
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

  services.pipewire.configPackages = [
    (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/10-allowed-sample-rates.conf" 
      ''
        context.properties = {
            default.clock.allowed-rates = [ 44100 48000 88200 96000 176400 192000 352800 384000 ]
        }
      ''
    )
  ];
}