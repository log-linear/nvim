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
          window = {
            submit_insert = '<s-cr>'
          },
        },
        ui = {
          window_type="split"
        },
      })

      -- Enable line wrapping for goose buffers only
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter" }, {
        callback = function(ev)
          local buf = ev.buf
          local buftype = vim.bo[buf].buftype
          local bufname = vim.api.nvim_buf_get_name(buf)

          -- Check if it's a scratch buffer or if the name contains [Scratch]
          if buftype == "nofile" or bufname:match("%[Scratch%]") or bufname == "" then
            -- Additional check to see if it's likely a goose buffer
            local lines = vim.api.nvim_buf_get_lines(buf, 0, 1, false)
            if #lines > 0 or buftype == "nofile" then
              vim.wo[0].wrap = true
            end
          end
        end,
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    },
  }
}
