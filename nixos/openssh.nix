{ config, lib, pkgs, ... }: {

    # OpenSSH configuration.
    services.openssh = {
        enable = true; # Enable OpenSSH server
        ports = [ 22 ];
        settings = {
            PasswordAuthentication = false; # Disabled for security, use SSH keys instead.
            AllowUsers = null; # Allows all users by default.
            UseDns = false;
            X11Forwarding = false;
            PermitRootLogin = "no"; # Disabled for security, root login via SSH is not recommended.
            AllowTcpForwarding = "no";
            ClientAliveCountMax = 1; # Number of client alive messages before disconnecting
            MaxAuthTries = 3; # Maximum number of authentication attempts per connection
            MaxSessions = 1; # Maximum number of open sessions per connection
            LogLevel = "VERBOSE"; # Needed by fail2ban to log SSH events.
        };
    };
}