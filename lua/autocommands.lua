--=============================== Autocommands =================================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function au(event, pattern, callback)
  vim.api.nvim_create_autocmd(event, { pattern = pattern, callback = callback })
end

-- General
au("WinEnter", { "term://*" }, function() vim.cmd [[startinsert]] end)
au("BufEnter", { "term://*" }, function() vim.opt.wrap = false end)
au("TextYankPost", { "*" }, function() vim.highlight.on_yank({ timeout = 250 }) end)

-- Create parent dirs on write
au("BufWritePre", { "*" }, function(ctx)
  if vim.tbl_contains({ "oil" }, vim.bo.ft) then
    return
  end
  vim.fn.mkdir(vim.fn.fnamemodify(ctx.file, ":p:h"), "p")
end)

-- Filetypes
au("BufEnter", { "*.ipynb" }, function()
  map("n", "<leader>jp", ":w<CR> :!jupyter nbconvert --to script %:p<CR> | :e %:p:r.py<CR>", { desc = "Convert notebook to .py"})
  map("n", "<leader>jm", ":w<CR> :!jupyter nbconvert --to markdown %:p<CR> | :e %:p:r.md<CR>", { desc = "Convert notebook to .md"})
end)

au("BufEnter", { "*.tsv" }, function() vim.opt.expandtab = false end)

