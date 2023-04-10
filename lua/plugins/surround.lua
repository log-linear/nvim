vim.g.sandwich_no_default_key_mappings = 1

return {
  "machakann/vim-sandwich",
  keys = {
    { "ys", "<Plug>(sandwich-add)", },
    { "cs", "<Plug>(sandwich-replace)", },
    { "ds", "<Plug>(sandwich-delete)", },
    { "ys", "<Plug>(sandwich-add)",   mode = "v" },
    { "cs", "<Plug>(sandwich-replace)", mode = "v" },
    { "ds", "<Plug>(sandwich-delete)",  mode = "v" },
  }
}
