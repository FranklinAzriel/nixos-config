{ config, lib, pkgs, ... }: {

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
      # Include the results of the hardware scan.
      ../hardware-configuration.nix

      ./audio.nix
      ./bootloader.nix
      ./container.nix
      ./desktop.nix
      ./drivers.nix
      ./kernel.nix
      ./luks.nix
      ./network.nix
      ./openssh.nix
      ./packages.nix
      ./steam.nix
      ./user.nix
      ./virtualisation.nix
      ./zram.nix
  ];
  
  nix.settings.auto-optimise-store = true;
  
  services.fwupd.enable = true;

  boot.tmp.useTmpfs = true;
  boot.tmp.cleanOnBoot = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/etc/nixos";
  };

  nixpkgs.config.allowUnfree = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

