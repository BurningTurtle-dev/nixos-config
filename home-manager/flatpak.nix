
{ ... }:

{
  services.flatpak = {
    packages = [
      "org.pvermeer.WebAppHub"
      #"com.yubico.yubioath"
      "com.discordapp.Discord"
      "us.zoom.Zoom"
      "com.github.xournalpp.xournalpp"
    ];
  };
}
