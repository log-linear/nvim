return {
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

  ------------------------- Indent line highlighting ---------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("indent_blankline").setup { show_current_context = true }
    end
  },

  ----------------------------- Highlight colors -------------------------------
  {
    "NvChad/nvim-colorizer.lua",
    keys = { { "<leader>co", ":ColorizerToggle<CR>" } },
    config = function() require 'colorizer'.setup({}) end
  },

  -------------------------- git markers in gutter -----------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  },
}
