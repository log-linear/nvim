return {
  "windwp/nvim-autopairs",
  keys = {
    { "]tp", ":lua require('nvim-autopairs').enable()<CR>" },
    { "[tp", ":lua require('nvim-autopairs').disable()<CR>" },
  },
  event = "InsertEnter",
  config = function() require('nvim-autopairs').setup({}) end
}
