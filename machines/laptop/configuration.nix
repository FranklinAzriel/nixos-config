{ pkgs, ... }: {
	imports = [
    	../../hardware-configuration.nix
    	./hardware-configuration

		../../common

		./audio
		./connectivity
		./desktop
		./firewall
    	./games
    	./hardening
		./packages
		./virtualization

		./appimage.nix
		./bootloader.nix
    	./nix-ld.nix
    	./opencl.nix
		./openssh.nix
    	./sysctl.nix
    	./udev-rules.nix
	];
  
  services.fwupd.enable = true;
}

