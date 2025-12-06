{ pkgs, ... }: {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    services.displayManager = {
    	sddm = {
    	enable = true;
    	wayland.enable = true;
      		settings = {
        		General.DisplayServer = "wayland";
      		};
    	}; 
  	};
}