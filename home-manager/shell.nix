{ pkgs, ... }: {
    programs.bash = {
        enable = true;
        initExtra = "source /etc/nixos/bash.bashrc";
    };
}