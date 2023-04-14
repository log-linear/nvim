local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.opt_local.wrap = true
vim.opt_local.linebreak = true

map("i", ";e", "**<left>", opts)
map("i", ";H", "<esc>yypv$r=o", opts)
map("i", ";h", "<esc>yypv$r-o", opts)
