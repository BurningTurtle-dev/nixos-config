
{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./modules/default.nix
    ];

  environment.variables = {
    EDITOR = "nvim";
    SOPS_AGE_SSH_PRIVATE_KEY_FILE="/etc/ssh/ssh_host_ed25519_key";
  };
  
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    age.keyFile = "/var/lib/sops-nix/key.txt";
  }; 

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };
  
  security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager = {
    after = [ "sops-nix.service" ];
    wants = [ "sops-nix.service" ];
  };

  # Time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = false;

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Enable fish shell (registers it in /etc/shells and provides completions).
  programs.fish.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Garbage collection
  nix.gc.automatic = true;
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
