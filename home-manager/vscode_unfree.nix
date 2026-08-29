{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
        ];
      };

      platformio = {
        extensions = with pkgs.vscode-extensions; [
          platformio.platformio-vscode-ide
          ms-vscode.cpptools
        ];
      };
    };
  };
}
