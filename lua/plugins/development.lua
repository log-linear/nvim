vim.g.sendtowindow_use_defaults = 0

-- (Re-)reads launch.json if present
local reload_launchjs = function()
  if vim.fn.filereadable(".vscode/launch.json") then
    require("dap.ext.vscode").load_launchjs(nil, { cpptools = { "c", "cpp" } })
  end
end

return {
  ----------------------------------- REPL -------------------------------------
  {
    "karoliskoncevicius/vim-sendtowindow",
    keys = {
      { "<A-CR>", "<Esc><Plug>SendDown", mode = { "n", "i" } },
      { "<A-CR>", "<Plug>SendDownV",     mode = "x" },
    },
  },

  -------------------------------- Debugging -----------------------------------
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dc",
        function()
          reload_launchjs()
          require("dap").continue()
        end,
        desc = "DAP: Continue/start debugging session",
      },
      { "<Leader>dT",  ":lua require'dap'.terminate()<CR>",                desc = "DAP: Terminate debugging session" },
      { "<leader>d,",  ":lua require'dap'.pause()<CR>",                    desc = "DAP: Pause debugging session" },
      { "<leader>dso", ":lua require'dap'.step_over()<CR>",                desc = "DAP: Step Over" },
      { "<leader>dsi", ":lua require'dap'.step_into()<CR>",                desc = "DAP: Step Into" },
      { "<leader>dsx", ":lua require'dap'.step_out()<CR>",                 desc = "DAP: Step Out" },
      { "<leader>dsb", ":lua require'dap'.step_back()<CR>",                desc = "DAP: Step Back" },
      { "<leader>dj",  ":lua require'dap'.down()<CR>",                     desc = "DAP: Go down current stacktrace" },
      { "<leader>dk",  ":lua require'dap'.up()<CR>",                       desc = "DAP: Go up current stacktrace" },
      { "<Leader>d.",  ":lua require'dap'.toggle_breakpoint()<CR>",        desc = "DAP: Toggle breakpoint" },
      { "<Leader>dr",  ":lua require'dap'.repl.toggle({height = 25})<CR>", desc = "DAP: Toggle REPL" },
      {
        "<Leader>dl",
        function()
          reload_launchjs()
          require("dap").run_last()
        end,
        desc = "DAP: Run last debugging session configuration"
      },
      { "<leader>dtm", ":lua require('dap-python').test_method())",         desc = "DAP: Test method" },
      { "<leader>dtc", ":lua require('dap-python').test_class())",          desc = "DAP: Test class" },
      { "<leader>ds",  ":lua require('dap-python').debug_selection()<CR>)", desc = "DAP: Debug selection" },
    },
    dependencies = { "mfussenegger/nvim-dap-python" },
    config = function()
      require('dap-python').setup("~/.local/share/mise/installs/python/latest/bin/python3")
      require('dap').defaults.fallback.terminal_win_cmd = "vs new | set nobl"

      -- Right click menu items
      vim.fn.sign_define('DapBreakpoint', { text = '⦿', texthl = '', linehl = '', numhl = '' })
      vim.cmd.amenu([[PopUp.DAP:\ Continue/start\ debugging\ session :lua require'dap'.continue()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Terminate\ debugging\ session :lua require'dap'.terminate()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Pause\ debugging\ session :lua require'dap'.pause()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Step\ Over :lua require'dap'.step_over()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Step\ Into :lua require'dap'.step_into()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Step\ Out :lua require'dap'.step_out()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Step\ Back :lua require'dap'.step_back()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Go\ down\ current\ stacktrace :lua require'dap'.down()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Go\ up\ current\ stacktrace :lua require'dap'.up()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Toggle\ breakpoint :lua require'dap'.toggle_breakpoint()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Open\ REPL :lua require'dap'.repl.open({height = 25})<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Run\ last\ debugging\ session\ configuration :lua require'dap'.run_last()<CR>]])
      vim.cmd.amenu([[PopUp.DAP:\ Test\ method :lua require('dap-python').test_method()]])
      vim.cmd.amenu([[PopUp.DAP:\ Test\ class :lua require('dap-python').test_class()]])
      vim.cmd.amenu([[PopUp.DAP:\ Debug\ selection :lua require('dap-python').debug_selection()<CR>]])
    end
  },

  --------------------------- Extended refactoring -----------------------------
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "cre",  ":Refactor extract<CR>",               mode = { "x" } },
      { "crf",  ":Refactor extract_to_file<CR>",       mode = { "x" } },
      { "crv",  ":Refactor extract_var<CR>",           mode = { "x" } },
      { "cri",  ":Refactor inline_var<CR>",            mode = { "n", "x" } },
      { "crI",  ":Refactor inline_func<CR>",           mode = { "n" } },
      { "crb",  ":Refactor extract_block<CR>",         mode = { "n" } },
      { "crbf", ":Refactor extract_block_to_file<CR>", mode = { "n" } },
    },
    config = function()
      require("refactoring").setup()
    end,
  },

  --------------------------------- Git support --------------------------------
  { "tpope/vim-fugitive" },

  ----------------------------- Code formatting --------------------------------
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "isort", "black" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          yaml = { "prettier" },
          sql = { "sqlfluff" },
        },
        default_format_opts = {
          lsp_format = "prefer",
        },
        formatters = {
          sqlfluff = {
            command = "sqlfluff",
            args = { "fix", "--dialect", "ansi", "$FILENAME" },
            stdin = false,
            cwd = function()
              return vim.fn.getcwd()
            end,
          }
        },
      })
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end
  },

  --------------------------------- Linting ------------------------------------
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        sql = { "sqlfluff" }
      }
      vim.api.nvim_create_autocmd({ "BufReadPost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  }

}
