{
	meta = {
		name = "NixOS";
		domain = "clan.lol";
	};

	inventory = {
		machines = {
			# Tags schema:
			# [Form] [Location] [Owner] [Country] etc
			#laptop = {
					#tags = [ "physical" "home" "personal" "indonesia" "home-manager" ];
			#};
			#briscoe = {
					#tags = [ "physical" "home" "personal" "indonesia" ];
			#};
			oracle-cloud = {
					tags = [ "virtual" "cloud" "personal" "singapore" ];
			};
			#dartnodes = {
					#tags = [ "virtual" "cloud" "personal" "united-states" ];
			#};
			#alibaba-cloud = {
					#tags = [ "virtual" "cloud" "personal" "singapore" ];
			#};
		#};
		#instances = {
			#FranklinAzriel-user = {
				#module.name = "users";
				#roles.default = {
					#tags = [ "home-manager" ];
					#settings = {
						#ser = "FranklinAzriel";
						#groups = [ "wheel" ];
					#};
					#extraModules = [ ./home-manager/default.nix ];
				#};
			#};
			#admin = {
				#roles.default = {
					#tags = [ "personal" ];
					#settings = {
						allowedKeys = { 
							"Trusted Key" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILl50pmugL84aI4kD038ls1NKgyDAv5oERwESf3SAYZT";
							"Trusted Backup Key" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMuViZcCcDLwNC1rJ26l8eBUV6DitM/O8B+akDN/Q9y8";
						};
					#};
				#};
			#};
			zerotier = {
				roles.controller.machines."oracle-cloud" = {};
				roles.peer.tags = [ "personal" ];
			};
		};
	};

	machines = {};

}