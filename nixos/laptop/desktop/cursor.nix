{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        # Cursors
        bibata-cursors
    ];

    system.fsPackages = [ pkgs.bindfs ];
    fileSystems = let
    mkRoSymBind = path: {
        device = path;
        fsType = "fuse.bindfs";
        options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
    };
    aggregated = pkgs.buildEnv {
        name = "system-fonts-and-icons";
        paths = config.fonts.packages ++ (with pkgs; [
            # Add your cursor themes and icon packages here
            bibata-cursors
            # etc.
        ]);
        pathsToLink = [ "/share/fonts" "/share/icons" ];
    };
    in {
        "/usr/share/fonts" = mkRoSymBind "${aggregated}/share/fonts";
        "/usr/share/icons" = mkRoSymBind "${aggregated}/share/icons";
    };
}