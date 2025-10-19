{ pkgs, ... }: {
    # Enable Flatpak service.
    services.flatpak.enable = true;

    # Add Flathub repository for Flatpak.
    systemd.services.flatpak-repo = {
        wantedBy = [ "multi-user.target" ];
        path = [ pkgs.flatpak ];
        script = ''
            flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        '';
    };
    # Install flatpak-builder for building Flatpak applications.
    environment.systemPackages = [ pkgs.flatpak-builder ];
}