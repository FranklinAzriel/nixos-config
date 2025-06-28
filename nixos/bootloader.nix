{ config, lib, pkgs, ... }: {

  # Lanzaboote currently replaces the systemd-boot module.
  # This setting is usually set to true in configuration.nix
  # generated at installation time. So we force it to false
  # for now.
  boot.loader.systemd-boot.enable = lib.mkForce false;

  # Lanzaboote configuration
  boot.lanzaboote = {
    enable = true; # Enable Lanzaboote.
    pkiBundle = "/var/lib/sbctl";
    configurationLimit = 1;
    settings = {
      beep = false; # "STUPID BEEP" AHH
      default = "auto-windows";
      timeout = 3;
      reboot-for-bitlocker = true; # Reboot for BitLocker is needed for unlocking Windows partitions.
      editor = true; # NOTE: Only applies if secure boot is disabled.
    };
  };
  
  boot.initrd.systemd.enable = true; # I forgot why this is needed, but it is needed.
  
  # Bootloader configuration
  boot.loader = {
    efi = {
        canTouchEfiVariables = true; # NOTE: Disable this if you need removable media support.
    };
  };

  # Needed packages for bootloader management.
  environment.systemPackages = [
    pkgs.sbctl
    pkgs.efibootmgr
  ];

  # Enable Plymouth for a graphical boot splash.
  boot = {
    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    # Enable "Silent Boot".
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
      "rd.luks.options=tpm2-device=auto" # For unlocking LUKS partitions with TPM2.
    ];  
  };
}
