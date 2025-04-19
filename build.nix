{ config, lib, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    hostPlatform = {
      system = "x86_64-linux";
      gcc.arch = "x86-64-v3";
    };
  };
  nix = {
    settings = {
      system-features = lib.mkForce [
        "gccarch-x86-64-v3"
        "benchmark"
        "big-parallel"
        "kvm"
        "nixos-test"
      ];
    };
    buildMachines = [
      {
        hostName = "localhost";
        systems = [ "x86_64-linux" ];
        supportedFeatures = [
          "gccarch-x86-64-v3"
          "benchmark"
          "big-parallel"
          "kvm"
          "nixos-test"
        ];
        maxJobs = 8;
      }
    ];
    distributedBuilds = true;
  };
}
