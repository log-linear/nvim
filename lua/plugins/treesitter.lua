local f = require("functions")

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
    "LiadOz/nvim-dap-repl-highlights",
  },
  config = function()
    require('nvim-dap-repl-highlights').setup()
    require "nvim-treesitter.configs".setup {
      ensure_installed = "all",
      sync_install = false,
      auto_install = false,
      ignore_install = false,
      modules = {},
      highlight = {
        enable = true,
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
        },
      },
      yati = { enable = true },
      textobjects = {
        select = {
          enable = true,
          disable = {
            "r",  -- Seems to be broken as of July 2024
            "dart"
          },
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "TS: Select outer part of a function region" },
            ["if"] = { query = "@function.inner", desc = "TS: Select inner part of a function region" },
            ["ac"] = { query = "@class.outer", desc = "TS: Select outer part of a class region" },
            ["ic"] = { query = "@class.inner", desc = "TS: Select inner part of a class region" },
            ["ab"] = { query = "@block.outer", desc = "TS: Select outer part of a block region" },
            ["ib"] = { query = "@block.inner", desc = "TS: Select inner part of a block region" },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "TS: Next function start" },
            ["]]"] = { query = "@class.outer", desc = "TS: Next class start" },
            ["]c"] = { query = "@class.outer", desc = "TS: Next class start" },
            ["]b"] = { query = "@block.outer", desc = "TS: Next block start" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "TS: Next function end" },
            ["]["] = { query = "@class.outer", desc = "TS: Next class end" },
            ["]C"] = { query = "@class.outer", desc = "TS: Next class end" },
            ["]B"] = { query = "@block.outer", desc = "TS: Next block end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "TS: Previous function start" },
            ["[["] = { query = "@class.outer", desc = "TS: Previous class start" },
            ["[c"] = { query = "@class.outer", desc = "TS: Previous class start" },
            ["[b"] = { query = "@block.outer", desc = "TS: Previous block start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "TS: Previous function end" },
            ["[]"] = { query = "@class.outer", desc = "TS: Previous class end" },
            ["[C"] = { query = "@class.outer", desc = "TS: Previous class end" },
            ["[B"] = { query = "@block.outer", desc = "TS: Previous block end" },
          },
        },
      },
      textsubjects = {
        enable = true,
        prev_selection = "<bs>", -- (Optional) keymap to select the previous selection
        keymaps = {
          ["<cr>"] = { query = "textsubjects-smart", desc = "TS: Smart container selection" },
          [";"] = { query = "textsubjects-container-outer", desc = "TS: Select outside containers (classes, functions, etc.)" },
          ["i;"] = { query = "textsubjects-container-inner", desc = "TS: Select inside containers (classes, functions, etc.)" },
        },
      },
    }
    require "treesitter-context".setup {
      enable = true,
      mode = "topline",
      multiline_threshold = 1
    }

    local m = require'markid'
    require'nvim-treesitter.configs'.setup {
      markid = {
        enable = false,
        disable = { "dart" },
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
        },
        is_supported = function(lang)
          local configs = require("nvim-treesitter.configs")
          local queries = configs.get_module("markid").queries
          if vim.treesitter.query.get(lang, 'markid') then
              return true
          else
              return pcall(vim.treesitter.query.parse, lang, queries[lang] or queries['default'])
          end
        end
      }
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
