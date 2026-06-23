
return {
  {
    "neovim/nvim-lspconfig",
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

  --------------------------- Auto-stop idle LSPs ------------------------------
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- your options here
    }
  },
  -- {
  --   "m-demare/hlargs.nvim",
  --   config = function()
  --     require('hlargs').setup {
  --       use_colorpalette = true,
  --       colorpalette = {
  --         -- { bg = "#a3c7b9" },
  --         -- { bg = "#ee90a4" },
  --         -- { bg = "#5cc8a7" },
  --         -- { bg = "#cfc0ff" },
  --         -- { bg = "#a5b26c" },
  --         -- { bg = "#e4d9ff" },
  --         -- { bg = "#8bd39b" },
  --         -- { bg = "#9fdeff" },
  --         -- { bg = "#e5c17c" },
  --         -- { bg = "#46bbc5" },
  --         -- { bg = "#ffe29f" },
  --         -- { bg = "#a4fff1" },
  --         -- { bg = "#b7ab8d" },
  --         -- { bg = "#d1ffe1" },
  --         -- { bg = "#fff6cd" },
  --         -- { bg = "#ebffd5" },
  --
  --         { fg = "#7b2f00" },
  --         { fg = "#003fa8" },
  --         { fg = "#dc0019" },
  --         { fg = "#1e79ce" },
  --         { fg = "#a53400" },
  --         { fg = "#004e73" },
  --         { fg = "#007c30" },
  --         { fg = "#930091" },
  --         { fg = "#558500" },
  --         { fg = "#e42358" },
  --         { fg = "#005c0e" },
  --         { fg = "#b8005a" },
  --         { fg = "#5c799e" },
  --         { fg = "#a46a1c" },
  --         { fg = "#87005b" },
  --         { fg = "#c55d00" },
  --       },
  --       hl_priority = 1000,
  --     }
  --     -- (You may omit the settings whose defaults you're ok with)
  --   end
  -- }
}
