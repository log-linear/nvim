--=============================== Autocommands =================================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function au(mode, pattern, callback)
  vim.api.nvim_create_autocmd(mode, { pattern = pattern, callback = callback })
end

-- General
au("WinEnter", { "term://*" }, function() vim.cmd [[startinsert]] end)
au("TextYankPost", { "*" }, function() vim.highlight.on_yank({ timeout = 250 }) end)

-- Create parent dirs on write
au("BufWritePre", { "*" }, function(ctx)
  local dir = vim.fn.fnamemodify(ctx.file, ":p:h")
  if vim.tbl_contains({ "oil" }, vim.bo.ft) then return
  elseif vim.fn.isdirectory(dir) == 0 then vim.fn.mkdir(dir, "p") end
end)

-- Filetypes
au("BufEnter", { "*.ipynb" }, function()
  map("n", "<leader>jp", ":w<CR> :!jupyter nbconvert --to script %:p<CR> | :e %:p:r.py<CR>", opts)
  map("n", "<leader>jm", ":w<CR> :!jupyter nbconvert --to markdown %:p<CR> | :e %:p:r.md<CR>", opts)
end)

au("FileType", { "json" }, function()
  map("n", "<leader>bf", ":w<CR> :%!python -m json.tool<CR>", opts)
end)

au("FileType", { "markdown" }, function()
  vim.opt_local.wrap = true
  vim.opt_local.linebreak = true
end)

au("FileType", { "markdown", "rmd" }, function()
  map("i", ";e", "**<left>", opts)
  map("i", ";H", "<esc>yypv$r=o", opts)
  map("i", ";h", "<esc>yypv$r-o", opts)
end)


au("FileType", { "tex" }, function() map("i", ";;", "\\", opts) end)
au("BufEnter", { "*.tsv" }, function() vim.opt.expandtab = false end)

-- Multi-modal mappings
au("FileType", { "r", "rmd" }, function()
  map({ "i", "t" }, ";;", "<-", opts)
  map({ "i", "t" }, ";n", "|>", opts)
  map({ "i", "t" }, ";m", "%>%", opts)
  map({ "i", "t" }, ";in", "%in%", opts)
  map({ "i", "t" }, ";r", "%%", opts)
  map({ "i", "t" }, ";v", "<space>|> vd()", opts)
  map({ "i", "t" }, ";V", "<space>|> View()", opts)
  map({ "i", "t" }, ";c", "<space>|> colnames()", opts)
  map({ "i", "t" }, ";o", "objs()", opts)
end)
au("FileType", { "python", "dot" }, function() map({ "i", "t" }, ";l", "->", opts) end)
