{ pkgs, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
	pname = "cachyos-settings-udev-rules";
  	version = "unstable-2025-10-18";

  	src = fetchFromGitHub {
    	owner = "CachyOS";
    	repo = "CachyOS-Settings";
    	rev = "master";
    	hash = "sha256-gCJd+JTLVj+VFRrP8YJC/YJSP7q5p2+Q06EDzLYAgas="; # REPLACE THIS HASH!
  	};

  	# Declare bash and hdparm as build inputs because we need their Nix store paths for substitution
  	buildInputs = [
    	pkgs.bash
    	pkgs.hdparm
  	];

  	installPhase = ''
    	# 1. Create the target directory
    	mkdir -p $out/lib/udev/rules.d

    	# 2. Copy the udev rules to the current directory for patching
    	cp $src/usr/lib/udev/rules.d/*.rules .

    	# 3. Patch the rules to replace hardcoded paths with Nix store paths
    
    	# Fix 1: Replace /usr/bin/bash
    	${pkgs.gnused}/bin/sed -i 's|/usr/bin/bash|${pkgs.bash}/bin/bash|g' *.rules

    	# Fix 2: Replace /usr/bin/hdparm
    	${pkgs.gnused}/bin/sed -i 's|/usr/bin/hdparm|${pkgs.hdparm}/bin/hdparm|g' *.rules
    
    	# 4. Move the fixed rules to the final output location
    	mv *.rules $out/lib/udev/rules.d/
  	'';

  	meta = with pkgs.lib; {
    	description = "Udev rules extracted from CachyOS-Settings repository for NixOS services.udev.packages";
    	homepage = "https://github.com/CachyOS/CachyOS-Settings";
    	license = licenses.gpl3Only;
    	platforms = platforms.linux;
  	};
}