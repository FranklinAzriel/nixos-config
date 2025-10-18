{
  description = "Holy NixOS - Made With Love";

  inputs = {
    # Base system is stable
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

  outputs = inputs@{ nixpkgs-stable, nixpkgs-unstable, home-manager, lanzaboote, ... }: 
  let
    system = "x86_64-linux";

    unstablePkgs = import nixpkgs-unstable {
      inherit system;

    };

  in {
    nixosConfigurations.Holy-Nix = nixpkgs-unstable.lib.nixosSystem {
      inherit system;
      
      specialArgs = {
        inherit unstablePkgs;
      };

      modules = [
        # Lanzaboote
        lanzaboote.nixosModules.lanzaboote

        ./nixos/configuration.nix
        {
            nix.settings.trusted-users = [ "FranklinAzriel" ];
        }

        home-manager.nixosModules.home-manager {
          home-manager.extraSpecialArgs = { inherit unstablePkgs; };
          
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.FranklinAzriel = import ./home-manager/home-manager.nix;
        }
      ];
    };
  };
}