{
	description = "Holy NixOS - Made With Love";

	inputs = {
    	nixpkgs-unstable.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

	    home-manager = {
    	  	url = "github:nix-community/home-manager";
      		inputs.nixpkgs.follows = "nixpkgs-unstable";
    	};

    	lanzaboote = {
      		url = "github:nix-community/lanzaboote/v0.4.3";
      		inputs.nixpkgs.follows = "nixpkgs-unstable";
    	};

    	disko = { 
      		url = "github:nix-community/disko";
      		inputs.nixpkgs.follows = "nixpkgs-unstable";
    	};

		chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

  	};

  	outputs = inputs@{ nixpkgs-unstable, home-manager, chaotic, lanzaboote, disko, self, ... }:
  	let
    system = "x86_64-linux";

    unstablePkgs = import nixpkgs-unstable {
    	inherit system;
    };

    # Reusable Home Manager options
    HomeManagerOptions = {
    	home-manager.useGlobalPkgs = true;
      	home-manager.useUserPackages = true;
      	home-manager.extraSpecialArgs = { inherit unstablePkgs; };
      	home-manager.users.FranklinAzriel = import ./home-manager/home-manager.nix;
    };
    
  	in {
    	#
    	# 1. NixOS Configuration for Laptop
    	# Usage: nixos-rebuild switch --flake .#Holy-Nix
    	#
    	nixosConfigurations.Holy-Nix = nixpkgs-unstable.lib.nixosSystem {
      		inherit system;
      
      		specialArgs = {
        		inherit unstablePkgs;
      		};

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
    	# 2. NixOS Configuration for Homelab
    	# Usage: nixos-rebuild switch --flake .#HomeLab
    	#
    	nixosConfigurations.HomeLab = nixpkgs-unstable.lib.nixosSystem {
      		inherit system;

      		specialArgs = {
        		inherit unstablePkgs;
      		};

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

    	#
    	# 3. Standalone Home Manager Configuration
    	# Usage: home-manager switch --flake .#homeConfigurations.FranklinAzriel
    	#
    	homeConfigurations.FranklinAzriel = home-manager.lib.homeManagerConfiguration {
      		inherit system;
      
      		# pkgs is required for standalone Home Manager
      		pkgs = unstablePkgs; 

      		modules = [
        		HomeManagerOptions
				chaotic.homeManagerModules.default
      		];
    	};
    
    	#
    	# 4. Alias for standalone Home Manager
    	# Usage: home-manager switch --flake .#home-manager
    	#
    	home-manager = self.homeConfigurations.FranklinAzriel;
  	};
}
