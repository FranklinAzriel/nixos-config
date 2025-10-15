{ config, pkgs, ... }: {
    programs.chromium = {
    enable = true;
    # Ensure you are using the correct package for Chrome Stable
    # This is typically 'google-chrome' or 'google-chrome-stable'
    package = pkgs.google-chrome;

    # Set your desired launch arguments as a list of strings
    commandLineArgs = [
      "--enable-features=VaapiVideoDecodeLinuxGL,AcceleratedVideoEncoder,VaapiVideoEncoder,Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo"
    ];
  };

    home.packages = with pkgs; [
	
	    # Shell
	    fzf
      fastfetch

      # Browser
      #google-chrome

      # Social Media
      telegram-desktop
      discord
      thunderbird

      # Development
      git
      uv
      gnupg
      postman
      #dbeaver-bin
      python3
      python3Packages.pip
      virtualenv
      nodejs
      nodePackages.npm

      kubectl
      kubernetes-helm
      # IDE
	    vscode
      #jetbrains.idea-community-bin
      
      # Multimedia
      vlc
      obs-studio

      # Games
      (prismlauncher.override {
        jdks = [
          temurin-jre-bin-8
          temurin-jre-bin
        ];
      })

      # Tools
      qdiskinfo        

	    # Password Manager
	    bitwarden-desktop

      # Torrent
      qbittorrent
      transmission_4

      playerctl
    ];
}
