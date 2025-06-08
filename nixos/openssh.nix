{ config, lib, pkgs, ... }: {
    services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
        PasswordAuthentication = false;
        AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
        UseDns = false;
        X11Forwarding = false;
        PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
    };
}