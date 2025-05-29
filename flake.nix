{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, chaotic, home-manager, lanzaboote, ... }: {
    nixosConfigurations.Holy-Nix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # CachyOS 
        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry

        # Lanzaboote
        lanzaboote.nixosModules.lanzaboote

        #./build.nix
        ./nixos/configuration.nix
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.FranklinAzriel = import ./home-manager/home-manager.nix;
        }
      ];
    };
  };
}
