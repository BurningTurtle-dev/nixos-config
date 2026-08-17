
{ ... }:

{
  services.flatpak = {
    enable = true;

    packages = [
      "org.pvermeer.WebAppHub"
    ];
  };
}
