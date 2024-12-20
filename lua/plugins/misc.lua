vim.cmd[[highlight! link SnacksIndent IblIndent]]
vim.cmd[[highlight! link SnacksIndentScope IblScope]]
vim.keymap.set("n", "]r", ":lua Snacks.words.jump(1, false)<CR>")
vim.keymap.set("n", "[r", ":lua Snacks.words.jump(-1, false)<CR>")

return {
  ----------------------------- Lots of goodies --------------------------------

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      indent = {
        enabled = true,
        animate = { enabled = false },
        char = "▏"
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      scope = { enabled = true },
      words = { enabled = true },
    },
  },
}
