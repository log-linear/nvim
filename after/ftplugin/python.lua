local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map({ "i", "t" }, ";l", "->", opts)
