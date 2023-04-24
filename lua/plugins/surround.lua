vim.g.sandwich_no_default_key_mappings = 1

return {
  "machakann/vim-sandwich",
  config = function ()
    vim.cmd[[runtime macros/sandwich/keymap/surround.vim]]
  end
}
