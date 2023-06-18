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
      { "<leader>dc",  ":lua require'dap'.continue()<CR>", },
      { "<Leader>dT",  ":lua require'dap'.terminate()<CR>", },
      { "<leader>dp",  ":lua require'dap'.pause()<CR>", },
      { "<leader>dso", ":lua require'dap'.step_over()<CR>", },
      { "<leader>dsi", ":lua require'dap'.step_into()<CR>", },
      { "<leader>dsx", ":lua require'dap'.step_out()<CR>", },
      { "<leader>dsb", ":lua require'dap'.step_back()<CR>", },
      { "<Leader>d.",  ":lua require'dap'.toggle_breakpoint()<CR>", },
      { "<Leader>dr",  ":lua require'dap'.repl.open()<CR>", },
      { "<Leader>dl",  ":lua require'dap'.run_last()<CR>", },
      { "<leader>dtm", ":lua require('dap-python').test_method())", },
      { "<leader>dtc", ":lua require('dap-python').test_class())", },
      { "<leader>ds",  ":lua require('dap-python').debug_selection()<CR>)", },
    },
    dependencies = { "mfussenegger/nvim-dap-python" },
    config = function()
      require('dap-python').setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
      vim.fn.sign_define('DapBreakpoint', { text = '⦿', texthl = '', linehl = '', numhl = '' })
    end
  },

  --------------------------------- Git support --------------------------------
  { "tpope/vim-fugitive" },
}
