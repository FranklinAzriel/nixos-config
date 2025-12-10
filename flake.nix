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

		};

		outputs = inputs@{ nixpkgs, home-manager, clan-core, lanzaboote, self, ... }:
		let
			system = "x86_64-linux";
		
			# Define Clan Framework
			clan = clan-core.lib.clan {
				inherit self;
				imports = [ ./clan.nix ];
				specialArgs = { inherit inputs; };
			};
		in
		{
			inherit (clan.config) nixosConfigurations nixosModules clanInternals;
			clan = clan.config;
		};
}
