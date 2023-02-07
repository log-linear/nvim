--=============================== Autocommands =================================
local au = vim.api.nvim_create_autocmd
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

au(
  "WinEnter",
  {
    pattern = { "term://*" },
    callback = function() vim.cmd [[startinsert]] end
  }
)
au(
  "TextYankPost",
  { callback = function() vim.highlight.on_yank({ timeout = 250 }) end }
)
au(
  "FileType",
  {
    pattern = { "markdown" },
    callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
    end
  }
)
au(
  "BufEnter",
  {
    pattern = { "*.ipynb" },
    callback = function()
      map("n", "<leader>jp", ":w<CR> :!jupyter nbconvert --to script %:p<CR> | :e %:p:r.py<CR>", opts)
      map("n", "<leader>jm", ":w<CR> :!jupyter nbconvert --to markdown %:p<CR> | :e %:p:r.md<CR>", opts)
    end
  }
)
au(
  "BufEnter",
  { pattern = { "*.tsv" }, callback = function() vim.opt.expandtab = false end }
)
au(
  "FileType",
  {
    pattern = { "json" },
    callback = function()
      map("n", "<leader>bf", ":w<CR> :%!python -m json.tool<CR>", opts)
    end
  }
)
au(
  "FileType",
  {
    pattern = { "markdown", "rmd" },
    callback = function()
      map("i", ";e", "**<left>", opts)
      map("i", ";H", "<esc>yypv$r=o", opts)
      map("i", ";h", "<esc>yypv$r-o", opts)
    end
  }
)
au(
  "FileType",
  { pattern = { "tex" }, callback = function() map("i", ";;", "\\", opts) end }
)

local modes = { "i", "t" }
au(
  "FileType",
  {
    pattern = { "r", "rmd" },
    callback = function()
      map(modes, ";;", "<-", opts)
      map(modes, ";n", "|>", opts)
      map(modes, ";m", "%>%", opts)
      map(modes, ";in", "%in%", opts)
      map(modes, ";r", "%%", opts)
      map(modes, ";v", "<space>|> vd()", opts)
      map(modes, ";V", "<space>|> View()", opts)
      map(modes, ";c", "<space>|> colnames()", opts)
      map(modes, ";o", "objs()", opts)
    end
  }
)
au(
  "FileType",
  {
    pattern = { "python" },
    callback = function() map(modes, ";l", "->", opts) end
  }
)
