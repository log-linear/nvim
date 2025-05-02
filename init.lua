--================================= init.lua ===================================
require("options")
require("keymaps")
require("autocommands")
require("colorscheme")
require("filetype")
require("lsp")

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

-- Temp fix for deprecated module vim.hl
vim.hl = vim.highlight

----------------------------- environment settings -----------------------------
if vim.loop.os_uname().sysname == "Windows_NT" then
  local winvimpath = vim.fn.stdpath("config") .. "/win.vim"
  vim.fn.execute("source " .. winvimpath)
end

local workvimpath = vim.fn.stdpath("config") .. "/work.lua"
if vim.loop.fs_stat(workvimpath) then
  vim.fn.execute("source " .. vim.fn.stdpath("config") .. "/work.lua")
end
