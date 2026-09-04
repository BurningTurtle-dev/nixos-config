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
      # tabstop = 4;
      # shiftwidth = 4;
    };

    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy = {
          enable = true;
          package = pkgs.wl-clipboard;
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [

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

      nvim-autopairs = {
        enable = true;
      };

      bufferline = {
        enable = true;
      };

      yazi = {
        enable = true;
      };

      cmp = {
        enable = true;
        settings = {
          snippet = {
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          };
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
        };
      };

      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;

      luasnip = {
        enable = true;
      };

      lspconfig = {
        enable = true;
        autoLoad = true;
      };
    };

    lsp = {
      servers = {
        clangd.enable = true;
        nixd.enable = true;
        basedpyright.enable = true;
        bashls.enable = true;
        lua_ls.enable = true;
        jsonls.enable = true;
        yamlls.enable = true;
        taplo.enable = true;
        lemminx.enable = true;
        marksman.enable = true;
      };

      inlayHints.enable = true;
    };

     keymaps = [
      # Your existing keymaps (like <leader>d, <leader>f, etc.)
      {
        mode = "n";
        key = "<leader>d";
        action = "<cmd>lua _G.next_problem()<CR>";
        options.desc = "Show diagnostic";
      }

      {
        mode = "n";
        key = "<leader>g";
        action = "<cmd>lua _G.next_fix()<CR>";
        options.desc = "Go to next problem";
      }

      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>lua _G.suggest_fix()<CR>";
        options.desc = "Suggest fix for selected problem";
      }

      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>bd<CR>";
        options.desc = "Closes current buffer";
      }

      {
        mode = "n";
        key = "<leader>q";
        action = "<cmd>bd!<CR>";
        options.desc = "Closes current buffer";
      }



      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Yazi<cr>";
        options.desc = "Open yazi explorer";
      }

    ]
    ++ (builtins.map (i: {
      mode = "n";
      key = "<leader>${toString i}";
      action = "<cmd>BufferLineGoToBuffer ${toString i}<CR>";
      options.desc = "Go to buffer ${toString i}";
    }) (builtins.genList (i: i + 1) 9))   # generates 1..9
    ++ [

      {
        mode = "n";
        key = "<leader>0";
        action = "<cmd>BufferLineGoToBuffer 10<CR>";
        options.desc = "Go to buffer 10";
      }
    ];


    globals = {
      mapleader = " ";
    };

    extraConfigLua = ''
      function _G.next_fix()
        vim.diagnostic.jump({ count = 1 })
      end

      function _G.suggest_fix()
        vim.lsp.buf.code_action()
      end

      function _G.next_problem()
        vim.diagnostic.open_float()
      end

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("TransparentEnable")
        end,
      })
    '';
  };
}
