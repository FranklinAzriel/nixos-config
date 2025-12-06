{ config, lib, pkgs, modulesPath, ... }: {

    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.extraModprobeConfig = ''
        options kvm_amd nested=1

        options rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y
        options rtw89pci disable_aspm_l1=y disable_aspm_l1ss=y
        options rtw89_core disable_ps_mode=y
        options rtw89core disable_ps_mode=y
    '';

    boot.kernelParams = [ "amd_pstate=active" "processor.max_cstate=5" ];
}