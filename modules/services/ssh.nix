{ ... }:

{
  users.users.user = {
    openssh.authorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGXuigam+HnCgQkPIGLItXmsqDaRFa/N9E5aITnzCnNw burningturtle@nixos"
    ];
  };

  services.openssh = {
  enable = true;
  openFirewall = true;
  ports = [ 4387 ];

  settings = {
    PasswordAuthentication = false;
    KbdInteractiveAuthentication = false;
    PermitRootLogin = "no";
    AllowUsers = [ "user" ];
    MaxAuthTries = 3;
    PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
  };
};
}
