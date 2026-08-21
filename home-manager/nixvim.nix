
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
      tabstop = 4;
      shiftwidth = 4;
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

    keymaps = [
      {
         mode = "n";
         key = "<leader>d";
         action = "<cmd>lua _G.next_problem()<CR>";
         options = {
           desc = "Show diagnostic";
         };
      }
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>lua _G.next_fix()<CR>";
        options = {
          desc = "Suggest fix for next problem";
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":Explore<CR>";
        options = {
          desc = "Open netrw explorer";
        };
      }

    
    ];

    globals = {
      mapleader = " ";
    };

    extraConfigLua = ''

      -- Function: Go to next diagnostic, then open code actions
      function _G.next_fix()
        local success = vim.diagnostic.jump({count = 1})
        if success then
          vim.lsp.buf.code_action()
        end
      end

      -- Function: Go to next problem
      function _G.next_problem()
      --  local success = vim.diagnostic.jump({count = 1})
      --  if success then
          vim.diagnostic.open_float()
      --  end
      end


      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("TransparentEnable")
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "c",
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true   -- use spaces
        end,
})

    '';
  };
}
