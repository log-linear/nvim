return {
  "mcchrish/zenbones.nvim",
  event = "VimEnter",
  priority = 1000,
  config = function()
    vim.g.zenwritten_compat = 1
    vim.opt.background = "light"
    vim.cmd.colorscheme("zenwritten")
    vim.cmd.highlight({ "Type", "guifg=#5F5F5F" })
    vim.cmd.highlight({ "link", "NormalNC", "Normal" })
    vim.cmd.highlight({ "ColorColumn", "guibg=#E5E5E5", })
    vim.cmd [[
      let fts = [ 'sh', 'r', 'sql', 'rmd', 'bash' ]
      au BufEnter * if index(fts, &ft) > 0 | hi Function guifg=#5C5C5C gui=bold | endif
      au BufLeave * if index(fts, &ft) > 0 | hi Function guifg=#353535 gui=NONE | endif
    ]]
  end
}
