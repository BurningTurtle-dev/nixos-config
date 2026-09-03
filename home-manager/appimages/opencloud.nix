{ appimageTools, fetchurl, makeDesktopItem }:

let
  pname = "opencloud";
  version = "4.0.0";
  src = fetchurl {
    url = "https://github.com/opencloud-eu/desktop/releases/download/v${version}/OpenCloud_Desktop-v${version}-linux-gcc-x86_64.AppImage";
    hash = "sha256:22c5fac4453ce2bfb033f4a4f288aea33bbdc1178518026973f76b1c5c4e1d2c";
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

  profile = ''
    unset QT_QPA_PLATFORMTHEME
    unset QT_STYLE_OVERRIDE
  '';
}
