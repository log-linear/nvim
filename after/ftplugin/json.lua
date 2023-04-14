local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>bf", ":w<CR> :%!python -m json.tool<CR>", opts)


