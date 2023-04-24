return {
  "mcchrish/zenbones.nvim",
  event = "VimEnter",
  config = function()
    vim.g.zenwritten_compat = 1
    vim.opt.background = "light"
    vim.cmd.colorscheme("zenwritten")
    vim.cmd.highlight({ "Type", "guifg=#5f5f5f", "gui=italic" })
    vim.cmd.highlight({ "link", "NormalNC", "Normal" })
    vim.cmd.highlight({ "DiagnosticUnnecessary", "guibg=#DDDDDD" })
    vim.cmd.highlight({ "DiagnosticUnderlineError", "guibg=#EFDFE0", "guisp=#A8334C", "gui=undercurl", "cterm=undercurl" })
    vim.cmd.highlight({ "DiagnosticUnderlineHint", "guibg=#EFDEEB", "guisp=#88507D", "gui=undercurl", "cterm=undercurl" })
    vim.cmd.highlight({ "DiagnosticUnderlineInfo", "guibg=#D9E4EF", "guisp=#286486", "gui=undercurl", "cterm=undercurl" })
    vim.cmd.highlight({ "DiagnosticUnderlineWarn", "guibg=#EFDFDC", "guisp=#944927", "gui=undercurl", "cterm=undercurl" })
    vim.cmd.highlight({ "ColorColumn", "guibg=#E5E5E5", })
    vim.cmd.highlight({ "IndentBlanklineContextChar", "guifg=#353535", "gui=nocombine" })
    vim.cmd.highlight({ "Function", "guifg=#5C5C5C", "gui=bold" })
    vim.cmd.highlight({ "Special", "guifg=#6f6f6f", "gui=bold,italic" })
  end
}
