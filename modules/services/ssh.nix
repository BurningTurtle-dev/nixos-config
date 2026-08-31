{ ... }:

{
  services.openssh = {
  enable = true;
  openFirewall = true;
  ports = [ 8273 ];

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
