{ ... }:

{
  imports = [
    ./other.nix
    #./docker.nix
    ./powermanagement.nix
    ./ssh.nix
    ./servers/default.nix
    ./auto-upgrade.nix
  ];
}
