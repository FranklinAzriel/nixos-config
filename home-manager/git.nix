{ config, pkgs, ... }: {
    programs.git = {
        enable = true;
        lfs.enable = true;
        settings = {
            user.name = "FranklinAzriel";
            user.email = "FranklinAzriel6942@gmail.com";
        };
        signing.signByDefault = true;
        signing.key = "0xDD35555717C0F0AD";
    };
}
