{ pkgs, ... }: {

    # Enable KDE Plasma 6 desktop environment.
    services.desktopManager.plasma6.enable = true;
     
    services.displayManager.sddm.enable = true;

    # Enable Fcitx5 input method with Mozc for Japanese input.
    i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.addons = with pkgs; [
            fcitx5-mozc
            fcitx5-gtk
        ];
    };
}