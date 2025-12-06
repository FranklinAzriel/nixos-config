{ config, lib, pkgs, ... }: let
  NEED_TO_FIX_IN_UPSTREAM = builtins.foldl' (a: c: let
    is_conflict = c.pname == "font-cursor-misc" || c.pname == "font-misc-misc";
    package = if is_conflict then c.overrideAttrs {
      # remove fonts.dir on both packages
      fixupPhase = "rm -f $out/share/fonts/X11/misc/fonts.dir";
    } else c;
    font_dir = lib.fileContents "${c}/share/fonts/X11/misc/fonts.dir";
  in a // {
    packages = a.packages ++ [package];
    fonts-dirs = a.fonts-dirs ++ lib.optional is_conflict font_dir;
  }) {
    fonts-dirs = [];
    packages = [
      # concat fonts.dir and store in another derivation
      (pkgs.writeTextFile {
        text = let
          result = builtins.foldl' (a: c: let
            # split text
            split_txt = lib.splitString "\n" c;
          in {
            # sum first elem
            sum = builtins.fromJSON (lib.head split_txt) + a.sum;
            context = a.context + builtins.concatStringsSep "\n" (lib.tail split_txt) + "\n";
          }) { sum = 0; context = ""; } NEED_TO_FIX_IN_UPSTREAM.fonts-dirs;

          # and then concat all
        in "${toString result.sum}\n${result.context}";
        destination = "/share/fonts/X11/misc/fonts.dir";
        name = "fonts.dir";
      })
    ];
  } config.fonts.packages;
in  {
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
        paths = NEED_TO_FIX_IN_UPSTREAM.packages ++ (with pkgs; [
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
