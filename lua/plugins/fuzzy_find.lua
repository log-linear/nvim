vim.cmd.highlight({ "link", "SnacksPicker", "Normal", })
return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        enabled = true,
        win = {
          input = {
            keys = {
              ["<c-space>"] = { "toggle_live", mode = { "i", "n" } },
            }
          }
        }
      },
      win = {
        backdrop = {
          bg = "#FFFFFF",
          blend = 80
        }
      }
    },
    keys = {
      { "<leader>:",         function() Snacks.picker.commands() end,                                desc = "Command History" },
      ---- find
      { "<leader>ff",        function() Snacks.picker.files() end,                                  desc = "Find Files" },
      { "<leader>fF",        function() Snacks.picker.files({ hidden = true, ignored = true }) end, desc = "Find Files" },
      { "<leader>bl",        function() Snacks.picker.buffers() end,                                desc = "Buffers" },
      { "<leader>fr",        function() Snacks.picker.recent() end,                                 desc = "Recent" },
      { "<leader>z",         function() Snacks.picker.zoxide() end,                                 desc = "Recent" },
      -- { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      ---- git
      { "<leader>gf",        function() Snacks.picker.git_files() end,                              desc = "Find Git Files" },
      { "<leader>gl",        function() Snacks.picker.git_log() end,                                desc = "Git Log" },
      -- { "<leader>gs", function() Snacks.picker.git_status() end,                             desc = "Git Status" },
      ---- Grep
      { "<leader>%",         function() Snacks.picker.lines() end,                                  desc = "Buffer Lines" },
      { "<leader>/",         function() Snacks.picker.grep() end,                                   desc = "Grep" },
      { "<leader><leader>/", function() Snacks.picker.grep({ hidden = true, ignored = true, }) end, desc = "Grep" },
      -- { "<leader><leader>B", function() Snacks.picker.grep_buffers() end,                           desc = "Grep Open Buffers" },
      { "<leader>*",         function() Snacks.picker.grep_word() end,                              desc = "Visual selection or word", mode = { "n", "x" } },
      ---- search
      -- { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
      -- { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
      -- { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
      -- { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
      -- { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
      { "<leader>fh",        function() Snacks.picker.help() end,                                   desc = "Help Pages" },
      { "<leader>sH",        function() Snacks.picker.highlights() end,                             desc = "Highlights" },
      { "<leader>gj",        function() Snacks.picker.jumps() end,                                  desc = "Jumps" },
      { "<leader>fm",        function() Snacks.picker.keymaps() end,                                desc = "Keymaps" },
      -- { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
      -- { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
      -- { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
      -- { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
      -- { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
      -- { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
      -- { "<leader>qp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
      ---- LSP
      -- { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
      { "gr",                function() Snacks.picker.lsp_references() end,                         nowait = true,                     desc = "References" },
      { "gI",                function() Snacks.picker.lsp_implementations() end,                    desc = "Goto Implementation" },
      { "gy",                function() Snacks.picker.lsp_type_definitions() end,                   desc = "Goto T[y]pe Definition" },
      -- { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    },
  }
}
