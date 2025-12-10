{
	boot.loader.grub = {
		enable = true;
		efiInstallAsRemovable = true;
		efiSupport = true;
	};

  	disko.devices = {
    	disk = {
      		main = {
				name = "main-{{uuid}}";
        		type = "disk";
        		device = "{{mainDisk}}";
        		content = {
          			type = "gpt";
          			partitions = {
            			ESP = {
              				size = "512M";
              				type = "EF00";
              				content = {
                				type = "filesystem";
                				format = "vfat";
                				mountpoint = "/boot";
                				mountOptions = [ "umask=0077" ];
              				};
            			};
            			luks = {
              				size = "100%";
              				content = {
                				type = "luks";
                				name = "crypted";
                				# disable settings.keyFile if you want to use interactive password entry
                				#passwordFile = "/tmp/secret.key"; # Interactive
                				settings = {
                  					allowDiscards = true;
                  					keyFile = "/tmp/secret.key";
                				};
                				additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
                				content = {
                  					type = "btrfs";
                  					extraArgs = [ "-f" ];
                  					subvolumes = {
                    					"@" = {
                      						mountpoint = "/";
                      						mountOptions = [
                        						"compress=zstd:3"
												"strictatime"
												"lazytime"
                      						];
                    					};
                    					"@home" = {
                      						mountpoint = "/home";
                      						mountOptions = [
                        						"compress=zstd:3"
												"strictatime"
												"lazytime"
                      						];
                    					};
                    					"@nix" = {
                      						mountpoint = "/nix";
                      						mountOptions = [
                        						"compress=zstd:3"
												"strictatime"
												"lazytime"
                      						];
                    					};
                    					"@swap" = {
                      						mountpoint = "/.swapvol";
                      						swap.swapfile.size = "8G";
                    					};
                  					};
                				};
              				};
            			};
          			};
        		};
      		};
    	};
  	};
}