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
        AllowTcpForwarding = "no"; # "yes", "no", "local", "remote", "all"
        ClientAliveCountMax = 1; # Number of client alive messages before disconnecting
        MaxAuthTries = 3; # Maximum number of authentication attempts per connection
        MaxSessions = 1; # Maximum number of open sessions per connection
        LogLevel = "VERBOSE"; # "QUIET", "FATAL", "ERROR", "INFO", "VERBOSE", "DEBUG", "DEBUG1", "DEBUG2", "DEBUG3"
        };
    };
}