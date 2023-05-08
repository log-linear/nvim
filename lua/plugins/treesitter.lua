return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "David-Kunz/markid",
    "yioneko/nvim-yati",
  },
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = 'all',
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
    }
    vim.keymap.set("n", "[t",
    ":TSDisable highlight<CR>:TSDisable markid<CR>:TSDisable indent<CR>:TSDisable yati<CR>")
    vim.keymap.set("n", "]t", ":TSEnable highlight<CR>:TSEnable markid<CR>:TSEnable indent<CR>:TSEnable yati<CR>")
  end,
}
