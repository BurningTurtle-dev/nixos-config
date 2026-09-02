{ pkgs, ... }:

{
  home.packages = [
    (pkgs.symlinkJoin {
      name = "opencloud-wrapped";
      paths = [ pkgs.opencloud-desktop ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/opencloud --set QT_STYLE_OVERRIDE ""
      '';
    })
  ];
}
