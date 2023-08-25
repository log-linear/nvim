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
    keys = { { "<leader>zm", ":ZenMode<CR>", desc = "zen-mode: Toggle" } },
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
    keys = { { "<leader>co", ":ColorizerToggle<CR>", desc = "nvim-colorizer: Toggle colorizer" } },
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
          end, { expr = true, desc = "gitsigns: Next change" })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "gitsigns: Previous change" })

          -- Actions
          map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = "gitsigns: Stage hunk" })
          map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = "gitsigns: Reset hunk" })
          map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "gitsigns: Undo stage hunk" })
          map('n', '<leader>hp', gs.preview_hunk, { desc = "gitsigns: Preview hunk" })
          map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "gitsigns: Toggle current line blame" })
          map('n', '<leader>hd', gs.diffthis, { desc = "gitsigns: diff this hunk" })
          map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "gitsigns: diff this hunk? IDK" })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  },

  ------------------------------- keymap hints ---------------------------------
  {
    'echasnovski/mini.clue',
    version = false,
    config = function()
      local miniclue = require('mini.clue')
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      })
    end
  },
}
