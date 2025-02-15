{ config, pkgs, ... }: {
    home.packages = with pkgs; [
        google-chrome

        telegram-desktop
        discord

        git
        gnupg
	    vscode
    ];
}