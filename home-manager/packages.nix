{ config, pkgs, ... }: {
    home.packages = with pkgs; [

        # Browser
        google-chrome

        # Social Media
        telegram-desktop
        discord

        # Development
        git
        gnupg
	    vscode

        # Multimedia
        vlc
        obs-studio

        # Games
        prismlauncher

    ];
}