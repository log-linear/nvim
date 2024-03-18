vim.g.sandwich_no_default_key_mappings = 1

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

  -------------------------------- Commenting ----------------------------------
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function() require("Comment").setup{} end
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

  ------------------------------- File browser ---------------------------------
  {
    "stevearc/oil.nvim",
    opts = {},
    config = function()
      require('oil').setup()
      vim.keymap.set("n", "<leader>fb", [[:vs ./<CR><C-\><C-n><C-w>H]], { desc = "Open file browser" })
    end
  }
}
