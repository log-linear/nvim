return {
  "tpope/vim-dadbod",
  ft = "sql",
  dependencies = { "kristijanhusak/vim-dadbod-completion", },
  config = function()
    vim.keymap.set({ "x", "n" }, "<Plug>(DBExe)", "db#op_exec()", { expr = true })
    vim.keymap.set({ "x", "n", "o" }, "<leader><CR>", "<Plug>(DBExe)")
    vim.keymap.set(
      "n",
      "<Leader>db",
      function()
        vim.ui.select(
          vim.g.dbnames,
          { prompt = "Select database:" },
          function(choice, idx)
            if choice then
              vim.w.db = vim.g.dburls[idx]
            else
              print("No choice selected.")
            end
          end
        )
      end
    )
  end,
}
