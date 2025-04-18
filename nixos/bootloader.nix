{ config, lib, pkgs, ... }: {
  # Lanzaboote currently replaces the systemd-boot module.
  # This setting is usually set to true in configuration.nix
  # generated at installation time. So we force it to false
  # for now.
  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
    configurationLimit = 1;
    settings = {
      beep = false;
      default = "auto-windows ";
      timeout = 3;
      reboot-for-bitlocker = true;
      editor = true;
    };
  };
  
  boot.initrd.systemd.enable = true;
  
  boot.loader = {
    efi = {
        canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = [
    pkgs.sbctl
    pkgs.efibootmgr
  ];

  boot = {
    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "rd.luks.options=tpm2-device=auto"
#      "resume=PARTLABEL=SWAPPART"
    ];  
  };
}
