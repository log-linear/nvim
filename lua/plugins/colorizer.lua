return {
  "NvChad/nvim-colorizer.lua",
  keys = { { "<leader>co", ":ColorizerToggle<CR>" } },
  config = function() require 'colorizer'.setup({}) end
}
