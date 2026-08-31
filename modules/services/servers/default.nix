{ ... }:

{
  imports = [
    ./jellyfin.nix
    ./cloudflared.nix
    ./vaultwarden.nix
  ];
}

