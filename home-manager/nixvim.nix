
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    clang-tools
  ];

  programs.nixvim = {
    enable = true;
    
    opts = {
      number = true;
      smartindent = false;
      autoindent = false;
      expandtab = false;
    };

    extraPlugins = with pkgs.vimPlugins; [
      netrw-nvim
    ];


    plugins = {
      transparent = {
        enable = true;
        autoLoad = true;
      };

      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
        folding.enable = false;

      grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          bash
          c
          json
          lua
          make
          markdown
          nix
          python
          regex
          toml
          vim
          vimdoc
          xml
          yaml
        ];
      };

      sleuth = {
        enable = true;
        autoLoad = true;
      };

      lualine = {
        enable = true;
      };


      lspconfig = {
        enable = true;
	autoLoad = true;
      };
    };

    lsp.servers = {
      clangd.enable = true;         # C
      nixd.enable = true;           # Nix
      basedpyright.enable = true;   # Python
      bashls.enable = true;         # Bash
      lua_ls.enable = true;         # Lua
      jsonls.enable = true;         # JSON
      yamlls.enable = true;         # YAML
      taplo.enable = true;          # TOML
      lemminx.enable = true;        # XML
      marksman.enable = true;       # Markdown
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
