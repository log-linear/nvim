vim.g.sandwich_no_default_key_mappings = 1

return {
  --------------------------------- Surround -----------------------------------
  {
    "machakann/vim-sandwich",
    config = function ()
      vim.cmd[[runtime macros/sandwich/keymap/surround.vim]]
    end
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
  }
}
