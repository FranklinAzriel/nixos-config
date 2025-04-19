{ config, pkgs, ... }: {
    home.packages = with pkgs; [
	
	    # Shell
	    fzf
        fastfetch
        
        # Browser
        google-chrome

        # Social Media
        telegram-desktop
        discord

        # Development
        git
        gnupg

        # IDE
	    vscode
        jetbrains.idea-community-bin

        # Multimedia
        vlc
        obs-studio

        # Games
        prismlauncher

        # Tools
        qdiskinfo
        
	    # Password Manager
	    bitwarden-desktop
    ];
}
