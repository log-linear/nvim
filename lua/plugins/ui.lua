local m = require("functions")
vim.cmd[[highlight! link SnacksIndent IblIndent]]
vim.cmd[[highlight! link SnacksIndentScope IblScope]]

local f = function(args) vim.b[args.buf].minimap_disable = true end
vim.api.nvim_create_autocmd("Filetype", { pattern = {"NvimTree", "oil" }, callback = f })

return {
  -------------------------- Dim inactive window splits ------------------------
  {
    "levouh/tint.nvim",
    config = function() require("tint").setup({ tint = 65, saturation = 0.4 }) end
  },

  ------------------------- Distraction-free writing ---------------------------
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>Zm", ":ZenMode<CR>", desc = "zen-mode: Toggle" } },
    config = function()
      require("zen-mode").setup { window = { backdrop = 1, width = 100, }, }
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
          map('n', ']h', function()
            if vim.wo.diff then return ']h' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "gitsigns: Next change" })

          map('n', '[h', function()
            if vim.wo.diff then return '[h' end
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
          map({ 'o', 'x' }, 'ah', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  },

  --------------------------------- input ui -----------------------------------
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      input = {
        enabled = true,
        win = {
          backdrop = {
            bg = "#FFFFFF",
            blend = 80
          }
        }
      },
      styles = {
        input = {
          position = "float",
          relative = "cursor",
          row = -3,
          col = 0,
        }
      },
    },
  },

  -------------------------------- select ui -----------------------------------
  {
    "leath-dub/snipe.nvim",
    keys = {
      { "gb", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
    },
    opts = {
      ui = {
        position = "center"
      }
    }
  },

  ------------------------------ buffer tab bar --------------------------------
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    --   'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    cond = m.neovide,
    event = "BufNew",
    init = function() vim.g.barbar_auto_setup = false end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    config = function ()
      require"barbar".setup{
        icons = { filetype = { enabled = false } },
      }
      local modes = { "n", "i", "v", "t" }
      vim.keymap.set(modes, "<A-p>", "<Cmd>BufferPrevious<CR>")
      vim.keymap.set(modes, "<A-n>", "<Cmd>BufferNext<CR>")
      vim.keymap.set(modes, "<A-P>", "<Cmd>BufferMovePrevious<CR>")
      vim.keymap.set(modes, "<A-N>", "<Cmd>BufferMoveNext<CR>")
      vim.keymap.set(modes, "<A-d>", "<Cmd>BufferWipe<CR>")
    end
  },

  -------------------------------- key hints -----------------------------------
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  ----------------------------- code breadcrumbs -------------------------------
  {
    'Bekaboo/dropbar.nvim',
    cond = m.neovide,
  },

  ------------------------------ indent guides ---------------------------------

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      indent = {
        enabled = true,
        animate = { enabled = false },
        char = "▏"
      },
      scope = { enabled = true },
    },
  },

  ------------------------------- notification UI --------------------------------
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      notifier = { enabled = true },
    },
  },

  ------------------------------- statuscolumn ---------------------------------
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      indent = {
        enabled = true,
        animate = { enabled = false },
        char = "▏"
      },
      statuscolumn = { enabled = true },
    },
  },

---------------------------------- scrollbar -----------------------------------
  {
    "echasnovski/mini.map",
    version = false,
    config = function()
      if m.neovide then
        map = require("mini.map")
        map.setup {
          symbols = {
            encode = map.gen_encode_symbols.dot("3x2"),
          }
        }
      map.open()
      end
    end,
    cond = m.neovide
  },

  -------------------------------- statusbar -----------------------------------
  {
    "echasnovski/mini.statusline",
    version = false,
    cond = m.neovide,
    config = function ()
      require("mini.statusline").setup()
    end
  },
}
