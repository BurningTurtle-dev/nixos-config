{ appimageTools, fetchurl, makeDesktopItem }:

let
  pname = "opencloud";
  version = "3.0.3";

  src = fetchurl {
    url = "https://github.com/opencloud-eu/desktop/releases/download/v${version}/OpenCloud_Desktop-v${version}-linux-gcc-x86_64.AppImage";
    hash = "sha256:00acc2f077a6dfdb6cb629c109601d66e7bcf97a06dd3aae15994d9e69454e92";
  };
  desktopItem = makeDesktopItem {
    name = pname;
    desktopName = "OpenCloud";
    exec = pname;
    icon = pname;
    categories = [ "Network" "FileTransfer" ];
  };
in
appimageTools.wrapType2 {
    inherit pname version src;
    extraInstallCommands = ''
      mkdir -p $out/share/applications
      cp ${desktopItem}/share/applications/*.desktop $out/share/applications/
    '';
  }
