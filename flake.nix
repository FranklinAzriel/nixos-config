{
	description = "Holy NixOS - Made With Love";

	inputs = {
    	nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

	    home-manager = {
    	  	url = "github:nix-community/home-manager";
      		inputs.nixpkgs.follows = "nixpkgs";
    	};

    	lanzaboote = {
      		url = "github:nix-community/lanzaboote/v0.4.3";
      		inputs.nixpkgs.follows = "nixpkgs";
    	};

		clan-core = {
 			url = "https://git.clan.lol/clan/clan-core/archive/main.tar.gz";
  			# Don't do this if your machines are on nixpkgs stable.
			# Don't worry i wont (ᵕ—ᴗ—)
  			inputs.nixpkgs.follows = "nixpkgs";
		};

		chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  	};

  	outputs = inputs@{ nixpkgs, home-manager, clan-core, chaotic, lanzaboote, self, ... }:
  	let
    system = "x86_64-linux";

    # Reusable Home Manager options
    HomeManagerOptions = {
    	home-manager.useGlobalPkgs = true;
      	home-manager.useUserPackages = true;
      	home-manager.users.FranklinAzriel = import ./home-manager/home-manager.nix;
    };
    
  	in {
    	#
    	# NixOS Configuration for Laptop
    	# Usage: nixos-rebuild switch --flake .#Holy-Nix
    	#
    	nixosConfigurations.Holy-Nix = nixpkgs.lib.nixosSystem {
      		inherit system;

      		modules = [
        		# Bootloader / Secure Boot
        		lanzaboote.nixosModules.lanzaboote
        		chaotic.nixosModules.default

        		# System Configurations
        		./nixos/common/default.nix
        		./nixos/laptop/default.nix
        
        		# Home Manager Integration
        		home-manager.nixosModules.home-manager
        		HomeManagerOptions
      		];
    	};
    
    	#
    	# NixOS Configuration for Homelab
    	# Usage: nixos-rebuild switch --flake .#HomeLab
    	#
    	nixosConfigurations.HomeLab = nixpkgs.lib.nixosSystem {
      		inherit system;

      		modules = [
				chaotic.nixosModules.default
				
        		# System Configurations
        		./nixos/common/default.nix
        		./nixos/homelab/default.nix
        		./hardware-configuration.nix

        		# Home Manager Integration
        		home-manager.nixosModules.home-manager
        		HomeManagerOptions
      		];
    	};
  	};
}
