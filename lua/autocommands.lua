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
  -- Don't do it for Oil buffers
  if vim.tbl_contains({ "oil" }, vim.bo.ft) then
    return
  end
  vim.fn.mkdir(vim.fn.fnamemodify(ctx.file, ":p:h"), "p")
end)

-- Filetypes
au("BufEnter", { "*.tsv" }, function() vim.opt.expandtab = false end)

local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

-- Disable certain features when opening large files
local big_file = autogroup('BigFile', { clear = true })
vim.filetype.add({
  pattern = {
    ['.*'] = {
      function(path, buf)
        return vim.bo[buf] and vim.bo[buf].filetype ~= 'bigfile' and path and vim.fn.getfsize(path) > 1.5 * 1024 * 1024 and 'bigfile' or nil -- bigger than 500KB
      end,
    },
  },
})

autocmd({ 'FileType' }, {
  group = big_file,
  pattern = 'bigfile',
  callback = function(ev)
    vim.cmd('syntax off')
    vim.cmd('Gitsigns detach')
    vim.opt_local.foldmethod = 'manual'
    vim.opt_local.spell = false
    vim.schedule(function()
      vim.bo[ev.buf].syntax = vim.filetype.match({ buf = ev.buf }) or ''
    end)
  end,
})
