{ config, pkgs, ... }: {

    home.username = "FranklinAzriel";
    home.homeDirectory = "/home/FranklinAzriel";

    home.packages = with pkgs; [
        google-chrome

        telegram-desktop
        discord

        git
        gnupg
	vscode
    ];

    programs.git = {
        enable = true;
        lfs.enable = true;
        userName = "FranklinAzriel";
        userEmail = "FranklinAzriel6942@gmail.com";
        signing.signByDefault = true;
        signing.key = "0xCE02984C1DD7D4CD";
    };

    programs.gpg = {
        enable = true;
    };

    services.gpg-agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-qt;
    };

    # Let home Manager install and manage itself.
    programs.home-manager.enable = true;

    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "24.11";
}
