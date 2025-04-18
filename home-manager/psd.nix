{ config, pkgs, ... }: {
    services.psd.enable = true;
    services.psd.resyncTimer = "5min";
    services.psd.browsers = [
        "google-chrome"
    ];
}