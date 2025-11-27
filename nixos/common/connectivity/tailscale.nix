{ pkgs, ... }: {
    services.tailscale = {
        enable = true; # Enable Tailscale.
        authKeyFile = "/root/tailscale_key";
        extraUpFlags = [
            "--accept-dns=false"
        ]; 
    };

}