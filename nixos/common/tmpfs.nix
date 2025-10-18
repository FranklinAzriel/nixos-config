{ pkgs, ... }: {
    boot.tmp.useTmpfs = true;
    boot.tmp.cleanOnBoot = true;
}