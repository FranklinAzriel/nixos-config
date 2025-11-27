{ ... }: {
    services.openssh = {
        enable = true;
        settings = {
            PasswordAuthentication = false;
            PermitRootLogin = "prohibit-password";
        };
    };

    users.users.root.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILl50pmugL84aI4kD038ls1NKgyDAv5oERwESf3SAYZT Trusted Key"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMW+CIdlFb1QrvjxNQqI/jbbU7Ity6/lvaeMmoeJP0pV Holy-Nix"
    ];

}