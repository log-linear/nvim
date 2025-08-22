return {
  {
    "azorng/goose.nvim",
    config = function()
      -- Default configuration with all available options
      require('goose').setup({
        prefered_picker = nil,   -- 'telescope', 'fzf', 'mini.pick', 'snacks', if nil, it will use the best available picker
        keymap = {
          global = {
            toggle_fullscreen = '<leader>gF'
          },
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
        },
      }
    },
  }
}
