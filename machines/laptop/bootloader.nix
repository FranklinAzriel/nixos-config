{ lib, pkgs, inputs, ... }: {
  
	imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
  	
	# Lanzaboote currently replaces the systemd-boot module.
  	# This setting is usually set to true in configuration.nix
  	# generated at installation time. So we force it to false
  	# for now.
  	boot.loader.systemd-boot.enable = lib.mkForce false;

  	# Lanzaboote configuration
  	boot.lanzaboote = {
	    enable = true; # Enable Lanzaboote.
    	pkiBundle = "/var/lib/sbctl";
    	configurationLimit = 1;
    	settings = {
      	beep = false; # "STUPID BEEP" AHH
      	default = "auto-windows";
      	timeout = 3;
      	reboot-for-bitlocker = true; # Reboot for BitLocker is needed for unlocking Windows partitions.
      	editor = true; # NOTE: Only applies if secure boot is disabled.
    	};
  	};
  
  	boot.initrd.systemd.enable = true; # I forgot why this is needed, but it is needed.
  
  	# Bootloader configuration
  	boot.loader = {
    	efi = {
        	canTouchEfiVariables = true; # NOTE: Disable this if you need removable media support.
        	efiSysMountPoint = "/efi"; # Mount point for the EFI system partition.
    	};
  	};

  	# Needed packages for bootloader management.
  	environment.systemPackages = [
	    pkgs.sbctl
	    pkgs.efibootmgr
  	];

  	# Enable Plymouth for a graphical boot splash.
  	boot = {
    	plymouth = {
      		enable = false;
      		theme = "bgrt";
    	};

    # Enable "Silent Boot".
    	consoleLogLevel = 0;
    	initrd.verbose = false;
    	kernelParams = [
      		"quiet"
      		"boot.shell_on_fail"
      		"loglevel=3"
      		"rd.systemd.show_status=true"
      		"rd.udev.log_level=3"
      		"udev.log_priority=3"
      		"rd.luks.options=tpm2-device=auto" # For unlocking LUKS partitions with TPM2.
      		"panic=10"
    	];  
  	};

  	console = {
    	earlySetup = true;
    	font = "eurlatgr";
    	keyMap = "us";
  	};

}
