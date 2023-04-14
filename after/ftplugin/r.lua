local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.opt.shiftwidth = 2

-- Multi-modal mappings
map({ "i", "t" }, ";;", "<-", opts)
map({ "i", "t" }, ";n", "|>", opts)
map({ "i", "t" }, ";m", "%>%", opts)
map({ "i", "t" }, ";in", "%in%", opts)
map({ "i", "t" }, ";r", "%%", opts)
map({ "i", "t" }, ";v", "<space>|> vd()", opts)
map({ "i", "t" }, ";V", "<space>|> View()", opts)
map({ "i", "t" }, ";c", "<space>|> colnames()", opts)
map({ "i", "t" }, ";o", "objs()", opts)
