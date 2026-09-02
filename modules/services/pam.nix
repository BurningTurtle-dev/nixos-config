{ ... }:

{
  security.pam.services = {
    login.enableGnomeKeyring = true;
    swaylock.enableGnomeKeyring = true;
  };
}
