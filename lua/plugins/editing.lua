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

  -------------------------------- file tree -----------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    enabled = m.check_work_env,
    keys = {
      { "<leader>fb", ":NvimTreeToggle<CR>", { desc = "Open file browser" } }
    },
    config = function ()
      require("nvim-tree").setup()
    end
  },
}
