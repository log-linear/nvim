vim.g.sandwich_no_default_key_mappings = 1
local m = require("functions")

return {
  --------------------------------- Surround -----------------------------------
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function() require("nvim-surround").setup({}) end
  },

  ------------------------------ Text alignment --------------------------------
  {
    "junegunn/vim-easy-align",
    keys = {
      { "ga", "<Plug>(EasyAlign)", "n", "vim-easy-align: Align operator" },
      { "ga", "<Plug>(EasyAlign)", "x", "vim-easy-align: Visual mode alignment"},
    }
  },

  ------------------------- Auto-closing text pairs ----------------------------
  {
    "windwp/nvim-autopairs",
    keys = {
      { "]p", ":lua require('nvim-autopairs').enable()<CR>", "Autopairs: Enable" },
      { "[p", ":lua require('nvim-autopairs').disable()<CR>", "Autopairs: Disable" },
    },
    event = "InsertEnter",
    config = function() require('nvim-autopairs').setup({}) end
  },

  -------------------------- Auto-closing tag pairs ----------------------------
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function() require('nvim-ts-autotag').setup({}) end
  },

  -------------------------- Edit files in a buffer ----------------------------
  {
    "stevearc/oil.nvim",
    opts = {},
    config = function()
      require('oil').setup()
    end
  },

  ------------------------------- Performance ----------------------------------
  {
    "folke/snacks.nvim",
    lazy = false,
    ---@type snacks.Config
    opts = {
      quickfile = { enabled = true },
      bigfile = {
        enabled = true,
        setup = function(ctx)
          vim.api.nvim_create_autocmd({ "LspAttach" }, {
            buffer = ctx.buf,
            callback = function(args)
              vim.schedule(function()
                vim.lsp.buf_detach_client(ctx.buf, args.data.client_id)
              end)
            end,
          })
        end
      },
    },
  },

  -------------------------------- Split-join ----------------------------------
  {
    "echasnovski/mini.splitjoin",
    version = false,
    ---@module mini.nvim
    config = function ()
      require("mini.splitjoin").setup{
        mappings = {
          toggle = 'gs',
        }
      }
    end,
  },
}
