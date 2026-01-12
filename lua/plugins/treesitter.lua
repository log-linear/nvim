return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
    config = function ()
      vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function() vim.treesitter.start() end,
    })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      require("nvim-treesitter-textobjects").setup{
        select = {
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            -- ["@class.outer"] = "<c-v>", -- blockwise
          },
        },
        move = {
          set_jumps = true, -- whether to set jumps in the jumplist
        },
      }

      vim.keymap.set({"x", "o"}, "af", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end, {desc = "TS: Select outer part of a function region"})
      vim.keymap.set({"x", "o"}, "if", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects") end, {desc = "TS: Select inner part of a function region"})
      vim.keymap.set({"x", "o"}, "ac", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects") end, {desc = "TS: Select outer part of a class region"})
      vim.keymap.set({"x", "o"}, "ic", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects") end, {desc = "TS: Select inner part of a class region"})
      vim.keymap.set({"x", "o"}, "ab", function() require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects") end, {desc = "TS: Select outer part of a block region"})
      vim.keymap.set({"x", "o"}, "ib", function() require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects") end, {desc = "TS: Select inner part of a block region"})

      vim.keymap.set({"n", "x", "o"}, "]f", function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end, {desc = "TS: Next function start"})
      vim.keymap.set({"n", "x", "o"}, "]]", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end, {desc = "TS: Next class start"})
      vim.keymap.set({"n", "x", "o"}, "]c", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end, {desc = "TS: Next class start"})
      vim.keymap.set({"n", "x", "o"}, "]b", function() require("nvim-treesitter-textobjects.move").goto_next_start("@block.outer", "textobjects") end, {desc = "TS: Next block start"})

      vim.keymap.set({"n", "x", "o"}, "]F", function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end, {desc = "TS: Next function"})
      vim.keymap.set({"n", "x", "o"}, "][", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end, {desc = "TS: Next class"})
      vim.keymap.set({"n", "x", "o"}, "]C", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end, {desc = "TS: Next class"})
      vim.keymap.set({"n", "x", "o"}, "]B", function() require("nvim-treesitter-textobjects.move").goto_next_end("@block.outer", "textobjects") end, {desc = "TS: Next bloc"})

      vim.keymap.set({"n", "x", "o"}, "[f", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end, {desc = "TS: Previous function start"})
      vim.keymap.set({"n", "x", "o"}, "[[", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end, {desc = "TS: Previous class start"})
      vim.keymap.set({"n", "x", "o"}, "[c", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end, {desc = "TS: Previous class start"})
      vim.keymap.set({"n", "x", "o"}, "[b", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@block.outer", "textobjects") end, {desc = "TS: Previous block start"})

      vim.keymap.set({"n", "x", "o"}, "[F", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end, {desc = "TS: Previous function end"})
      vim.keymap.set({"n", "x", "o"}, "[]", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end, {desc = "TS: Previous class end"})
      vim.keymap.set({"n", "x", "o"}, "[C", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end, {desc = "TS: Previous class end"})
      vim.keymap.set({"n", "x", "o"}, "[B", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@block.outer", "textobjects") end, {desc = "TS: Previous block end"})

    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function ()
      require("treesitter-context").setup{
        multiline_threshold = 1,
        mode = "topline"
      }
    end
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    config = function ()
      require('nvim-dap-repl-highlights').setup()
   end
  },

}
