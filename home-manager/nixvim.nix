
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;
    
    opts = {
      number = true;
    };

    plugins = {
      smartcolumn.settings.colorcolumn = "80";
      transparent = {
        enable = true;
        autoLoad = true;
      };
      sleuth.enable = true;
    };

    extraConfigLua = ''
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("TransparentEnable")
        end,
      })
    '';
  };
}
