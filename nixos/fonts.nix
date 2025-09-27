{ config, lib, pkgs, ... }: {
    fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-emoji
        ];
        fontconfig = {
            defaultFonts = {
                sansSerif = [ "Noto Sans" ];
                serif = [ "Noto Serif" ];
                monospace = [ "Noto Sans Mono" ];
                emoji = [ "Noto Color Emoji" ];
            };
        };
    };
}