{ config, lib, pkgs, ... }: {
    services.fail2ban = {
        enable = true;
        maxretry = 6; # Maximum number of retries before banning an IP
        ignoreIP = [
            # Whitelist some subnets
            "10.0.0.0/8" "172.16.0.0/12" "192.168.0.0/16" "127.0.0.1/8"
        ];
        bantime = "1d"; # Duration of the ban
        bantime-increment = {
            enable = true; # Enable increment of bantime after each violation
            formula = "ban.Time * math.exp(float(ban.Count+1)*banFactor)/math.exp(1*banFactor)";
            multipliers = "1 2 4 8 16 32 64";
            maxtime = "168h"; # Do not ban for more than 1 week
            overalljails = true; # Calculate the bantime based on all the violations
        };
        jails = {
            sshd = {
                enable = true; # Enable SSH jail
                filter = "sshd"; # Use the default SSH filter
                logpath = "/var/log/auth.log"; # Path to the SSH log file
                maxretry = 5; # Maximum number of retries before banning an IP
                findtime = "10m"; # Time window for counting retries
            };
    };
}