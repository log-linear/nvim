return {
  "tpope/vim-dadbod",
  ft = "sql",
  dependencies = { "kristijanhusak/vim-dadbod-completion", },
  config = function()
    vim.keymap.set({ "x", "n" }, "<Plug>(DBExe)", "db#op_exec()", { expr = true })
    vim.keymap.set({ "x", "n", "o" }, "<leader><CR>", "<Plug>(DBExe)")
  end,
}
