return {
  ----------------------------- Indent detection -------------------------------
  { "Darazaki/indent-o-matic", lazy = false },

  -------------------------- Dim inactive window splits ------------------------
  {
    "levouh/tint.nvim",
    event = "WinNew",
    config = function() require("tint").setup({ tint = 65, saturation = 0.4 }) end
  },

  ------------------------- Distraction-free writing ---------------------------
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>zm", ":ZenMode<CR>" } },
    config = function()
      require("zen-mode").setup { window = { backdrop = 1, width = 100, }, }
    end
  },

  ------------------------- Easy code doc generation ---------------------------
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>doc",
        ":lua require('neogen').generate()<CR>",
        noremap = true,
      }
    },
    config = function()
      require('neogen').setup({ snippet_engine = "luasnip" })
    end
  },
}
