{
  description = "Holy NixOS - Made With Love";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs@{ nixpkgs-stable, nixpkgs-unstable, home-manager, lanzaboote, self, ... }:
  let
    system = "x86_64-linux";

    unstablePkgs = import nixpkgs-unstable {
      inherit system;
    };

    # Reusable options for both NixOS integration and standalone Home Manager
    HomeManagerOptions = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit unstablePkgs; };
      home-manager.users.FranklinAzriel = import ./home-manager/home-manager.nix;
    };
    
  in {
    # 1. NixOS Configuration for Laptop
    # Use: nixos-rebuild switch --flake .#Holy-Nix
    nixosConfigurations.Holy-Nix = nixpkgs-unstable.lib.nixosSystem {
      inherit system;
      
      specialArgs = {
        inherit unstablePkgs;
      };

      modules = [
        # Bootloader
        lanzaboote.nixosModules.lanzaboote

        # System Configurations
        ./nixos/common/default.nix
        ./nixos/laptop/default.nix

        # General System Options
        {
          nix.settings.trusted-users = [ "FranklinAzriel" ];
        }
        
        # Home Manager Integration (for NixOS)
        home-manager.nixosModules.home-manager
        HomeManagerOptions
      ];
    };

    # 2. Standalone Home Manager Configuration
    # Use: home-manager switch --flake .#homeConfigurations.FranklinAzriel
    homeConfigurations.FranklinAzriel = home-manager.lib.homeManagerConfiguration {
      inherit system;
      
      # pkgs is required for standalone Home Manager
      pkgs = unstablePkgs; 

      # Use the same configuration options
      modules = [
        HomeManagerOptions
      ];
    };
    
    # 3. Alias for the standalone Home Manager configuration
    # Use: home-manager switch --flake .#home-manager
    home-manager = self.homeConfigurations.FranklinAzriel;
  };
}