
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  -------------------------- Embedded lsp support -----------------------------
  {
    'jmbuhr/otter.nvim',
    keys = {
      { "<leader>ot", ":lua require'otter'.activate()<CR>", desc = "Otter.nvim: Enable nested LSP"}
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },
  ---------------------------- LSP reference nav -------------------------------
  {
    "folke/snacks.nvim",
    priority = 1000,
    keys = {
      -- Reference jumping
      { "]r", ":lua Snacks.words.jump(1, false)<CR>",  { desc = "Next reference" } },
      { "[r", ":lua Snacks.words.jump(-1, false)<CR>", { desc = "Previous reference" } },
    },
    lazy = false,
    ---@type snacks.Config
    opts = {
      words = { enabled = true },
    },
  },

  ---------------------------- Turn off idle LSPs ------------------------------
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- your options here
    }
  },
}
