
{ pkgs, ... }:

{

  home.packages = with pkgs; [
    zathuraPkgs.zathura_pdf_mupdf
  ];
  programs.zathura = {
    enable = true;

    options = {
      selection-clipboard = "clipboard";
    };

    mappings = {
      "<Right>" = "navigate next";
      "<Left>" = "navigate previous";
    };
  };
}
