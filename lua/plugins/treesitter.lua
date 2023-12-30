return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "David-Kunz/markid",
    "yioneko/nvim-yati",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-textsubjects",
  },
  config = function()
    require "nvim-treesitter.configs".setup {
      ensure_installed = "all",
      ignore_install = { "t32" },
      highlight = {
        enable = true,
        disable = function(lang, bufnr) -- Disable in large buffers
          return vim.api.nvim_buf_line_count(bufnr) > 50000
        end,
      },
      markid = {
        enable = true,
        colors = {
          "#7b2f00",
          "#003fa8",
          "#dc0019",
          "#1e79ce",
          "#a53400",
          "#004e73",
          "#007c30",
          "#930091",
          "#558500",
          "#e42358",
          "#005c0e",
          "#b8005a",
          "#5c799e",
          "#a46a1c",
          "#87005b",
          "#573800",
          "#6f00ad",
          "#840019",
          "#93675f",
          "#c55d00",
        }
      },
      indent = {
        enable = true,
        disable = {
          "python",
          "lua",
          "javascript",
          "html",
          "json",
          "toml",
          "c",
          "css",
          "cpp",
          "typescript",
          "rust",
          "vue",
        }
      },
      yati = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]]"] = { query = "@class.outer", desc = "Next class start" },
            ["]b"] = { query = "@block.outer", desc = "Next block start" },
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]["] = "@class.outer",
            ["]B"] = { query = "@block.outer", desc = "Next block end" },
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[["] = "@class.outer",
            ["[b"] = { query = "@block.outer", desc = "Previous block start" },
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[]"] = "@class.outer",
            ["[B"] = { query = "@block.outer", desc = "Previous block end" },
          },
        },
      },
      textsubjects = {
        enable = true,
        prev_selection = "<bs>", -- (Optional) keymap to select the previous selection
        keymaps = {
          ["<cr>"] = "textsubjects-smart",
          [";"] = "textsubjects-container-outer",
          ["i;"] = "textsubjects-container-inner",
          ["i;"] = { "textsubjects-container-inner", desc = "Select inside containers (classes, functions, etc.)" },
        },
      },
    }
    require "treesitter-context".setup {
      enable = false,
      mode = "topline",
      multiline_threshold = 1
    }
    vim.keymap.set("n", "]tt", ":TSEnable highlight<CR>:TSEnable markid<CR>:TSEnable indent<CR>:TSEnable yati<CR>",
      { desc = "TS: Enable all modules" })
    vim.keymap.set("n", "]tt", ":TSEnable highlight<CR>:TSEnable markid<CR>:TSEnable indent<CR>:TSEnable yati<CR>",
      { desc = "TS: Enable all modules" })
    vim.keymap.set("n", "[th", ":TSDisable highlight<CR>", { desc = "TS: Disable highlighting" })
    vim.keymap.set("n", "]th", ":TSEnable highlight<CR>", { desc = "TS: Enable highlighting" })
    vim.keymap.set("n", "[tm", ":TSDisable markid<CR>", { desc = "TS: Disable markid" })
    vim.keymap.set("n", "]tm", ":TSEnable markid<CR>", { desc = "TS: Enable markid" })
    vim.keymap.set("n", "[tc", ":TSContextDisable<CR>", { desc = "TS: Disable context" })
    vim.keymap.set("n", "]tc", ":TSContextEnable<CR>", { desc = "TS: Enable context" })
  end,
}
