{ pkgs, ... }: {

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