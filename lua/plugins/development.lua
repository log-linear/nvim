vim.g.sendtowindow_use_defaults = 0

return {
  ----------------------------------- REPL -------------------------------------
  {
    "karoliskoncevicius/vim-sendtowindow",
    keys = {
      { "<A-CR>", "<Esc><Plug>SendDown", mode = { "n", "i" } },
      { "<A-CR>", "<Plug>SendDownV",     mode = "x" },
    },
  },

  ---------------------------- Code documentation ------------------------------
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>doc",
        ":lua require('neogen').generate()<CR>",
        noremap = true,
      }
    },
    config = function()
      require('neogen').setup({ snippet_engine = "luasnip" })
    end
  },

  -------------------------------- Debugging -----------------------------------
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dc",  ":lua require'dap'.continue()<CR>",                  desc = "DAP: Continue/start debugging session" },
      { "<Leader>dT",  ":lua require'dap'.terminate()<CR>",                 desc = "DAP: Terminate debugging session" },
      { "<leader>d,",  ":lua require'dap'.pause()<CR>",                     desc = "DAP: Pause debugging session" },
      { "<leader>dso", ":lua require'dap'.step_over()<CR>",                 desc = "DAP: Step Over" },
      { "<leader>dsi", ":lua require'dap'.step_into()<CR>",                 desc = "DAP: Step Into" },
      { "<leader>dsx", ":lua require'dap'.step_out()<CR>",                  desc = "DAP: Step Out" },
      { "<leader>dsb", ":lua require'dap'.step_back()<CR>",                 desc = "DAP: Step Back" },
      { "<leader>dj",  ":lua require'dap'.down()<CR>",                      desc = "DAP: Go down current stacktrace" },
      { "<leader>dk",  ":lua require'dap'.up()<CR>",                        desc = "DAP: Go up current stacktrace" },
      { "<Leader>d.",  ":lua require'dap'.toggle_breakpoint()<CR>",         desc = "DAP: Toggle breakpoint" },
      { "<Leader>dr",  ":lua require'dap'.repl.open({height = 25})<CR>",    desc = "DAP: Open REPL" },
      { "<Leader>dl",  ":lua require'dap'.run_last()<CR>",                  desc = "DAP: Run last debugging session configuration" },
      { "<leader>dtm", ":lua require('dap-python').test_method())",         desc = "DAP: Test method" },
      { "<leader>dtc", ":lua require('dap-python').test_class())",          desc = "DAP: Test class" },
      { "<leader>ds",  ":lua require('dap-python').debug_selection()<CR>)", desc = "DAP: Debug selection" },
    },
    dependencies = { "mfussenegger/nvim-dap-python" },
    config = function()
      require('dap-python').setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
      require('dap.ext.vscode').load_launchjs()
      vim.fn.sign_define('DapBreakpoint', { text = '⦿', texthl = '', linehl = '', numhl = '' })
    end
  },

  --------------------------------- Git support --------------------------------
  { "tpope/vim-fugitive" },

}
