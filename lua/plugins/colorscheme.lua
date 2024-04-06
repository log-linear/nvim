return {
  "mcchrish/zenbones.nvim",
  dependencies = {
    "rktjmp/lush.nvim",
  },
  enabled = false,
  event = "VimEnter",
  config = function()
    vim.g.zenwritten_compat = 1
    vim.opt.background = "light"
    vim.cmd.colorscheme("zenwritten")
    vim.cmd.highlight({ "Type", "guifg=#151515", "gui=None" })
    vim.cmd.highlight({ "link", "NormalNC", "Normal" })
    vim.cmd.highlight({ "DiagnosticUnnecessary", "guibg=#DDDDDD" })
    vim.cmd.highlight({ "ColorColumn", "guibg=#E5E5E5", })
    vim.cmd.highlight({ "IndentBlanklineContextChar", "guifg=#353535", "gui=nocombine" })
    vim.cmd.highlight({ "Function", "guifg=#505050", "gui=bold" })
  end
}
