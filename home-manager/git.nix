{ config, pkgs, ... }: {
    programs.git = {
        enable = true;
        lfs.enable = true;
        userName = "FranklinAzriel";
        userEmail = "FranklinAzriel6942@gmail.com";
        signing.signByDefault = true;
        signing.key = "0xCE02984C1DD7D4CD";
    };
}
