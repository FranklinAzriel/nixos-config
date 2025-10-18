{ config, lib, pkgs, ... }: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      settings = {
        General.DisplayServer = "wayland";
      };
    }; 
  };

  # Enable the KDE Plasma 6 desktop environment.
  services.desktopManager.plasma6.enable = true;

  # Needed packages for KDE Plasma 6.
  environment.systemPackages = with pkgs; [
    # KDE Plasma basic packages
    kdePackages.plasma-desktop
    kdePackages.plasma-vault
    kdePackages.qtsvg
    kdePackages.filelight
    kdePackages.kolourpaint
    kdePackages.kteatime

    # KDE Plasma partition tools
    kdePackages.partitionmanager
    kdiskmark

    # Virtual desktops
    kara

    # Cursors
    bibata-cursors
  ];
    
  i18n.inputMethod = {
   type = "fcitx5";
   enable = true;
   fcitx5.addons = with pkgs; [
     fcitx5-mozc
     fcitx5-gtk
   ];
 };

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
