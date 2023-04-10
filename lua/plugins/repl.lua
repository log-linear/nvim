vim.g.sendtowindow_use_defaults = 0

return {
  "karoliskoncevicius/vim-sendtowindow",
  keys = {
    { "<A-CR>", "<Esc><Plug>SendDown", mode = { "n", "i" } },
    { "<A-CR>", "<Plug>SendDownV",     mode = "x" },
  },
}
