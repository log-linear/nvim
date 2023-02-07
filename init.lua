--================================= init.lua ===================================
require("options")
require("keymaps")
require("autocommands")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

----------------------------- environment settings -----------------------------
vim.cmd[[
  if has("win64") || has("win32") || has("win16")
    exec 'source ' . stdpath("config") . '/win.vim'
  endif

  if !empty(glob(stdpath("config") . '/work.vim'))
    exec 'source ' . stdpath("config") . '/work.vim'
  endif
]]
