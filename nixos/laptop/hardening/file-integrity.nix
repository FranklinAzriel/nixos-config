{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        aide
    ];
}