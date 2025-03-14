{ config, pkgs, ... }: {

    home.username = "FranklinAzriel";
    home.homeDirectory = "/home/FranklinAzriel";

    imports = [
        ./git.nix
        ./gpg.nix
        ./mangohud.nix
        ./packages.nix
        ./shell.nix
    ];

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
