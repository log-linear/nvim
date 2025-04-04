-- R.nvim options
vim.g.R_fun_data_1 = {
  "select",
  "rename",
  "mutate",
  "filter",
  "group_by",
  "pivot_longer",
  "pivot_wider",
  "unnest_longer",
  "unnest_wider",
  "hoist",
  "separate_wider_delim",
  "complete",
  "drop_na",
  "fill",
}
vim.g.R_fun_data_2 = {
  mutate = { "*" },
  rename = { "*" },
  filter = { "*" },
  group_by = { "*" },
  ggplot = { "aes" },
  with = { "*" },
  summarize = { "*" },
  summarise = { "*" },
  hoist = { "*" },
  separate_wider_delim = { "*" },
  complete = { "*" },
  drop_na = { "*" },
  fill = { "*" },
}

return {
  ----------------------------- Auto-completion --------------------------------
  {
    "saghen/blink.cmp",
    build = vim.g.lazyvim_blink_main and "cargo build --release",
    version = "*",
    dependencies = {
      "rcarriga/cmp-dap",
      "R-nvim/cmp-r",
    },
    event = "InsertEnter",
    opts = {
      appearance = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = false,
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      completion = {
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = vim.g.ai_cmp,
        }
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', },
        providers = {
          dap = {
            name = "dap",
            module = "blink.compat.source"
          },
          cmp_r = {
            name = "cmp_r",
            module = "blink.compat.source"
          }
        }
      },

      keymap = {
        ["<C-y>"] = { "select_and_accept" },
      },
    }
  },
  {
    "saghen/blink.compat",
    version = not vim.g.lazyvim_blink_main and "*",
    lazy = true,
    opts = {}
  },

  ---------------------------- Snippet collection ------------------------------
  { "rafamadriz/friendly-snippets", },
}
