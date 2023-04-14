return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = 'make', },
    "nvim-telescope/telescope-file-browser.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  keys = {
    { "<leader>f",  "<cmd>Telescope<CR>" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    { "<leader>fF", "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>" },
    { "<leader>fb", "<cmd>:Telescope file_browser<CR>" },
    { "<leader>gf", "<cmd>Telescope git_files<CR>" },
    { "<leader>gc", "<cmd>Telescope git_bcommits<CR>" },
    { "<leader>bl", "<cmd>Telescope buffers<CR>" },
    { "<leader>%",  "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>" },
    { "<leader>/",  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" },
    { "<leader>*",  "<cmd>Telescope grep_string<CR>" },
    { "<leader>:",  "<cmd>Telescope commands<CR>" },
    { "<leader>fm", "<cmd>Telescope keymaps<CR>" },
    { "<leader>ft", "<cmd>Telescope filetypes<CR>" },
    { "<leader>fr", "<cmd>Telescope lsp_references<CR>" },
    { "<leader>u",  "<cmd>Telescope undo<CR>" },
  },
  config = function()
    local default_maps = {
      ["<A-a>"] = require("telescope.actions").toggle_all,
      ["<C-s>"] = require("telescope.actions").select_horizontal,
      ["<C-space>"] = require("telescope.actions").to_fuzzy_refine,
    }
    local buffers_maps = {
      ["<C-x>"] = require("telescope.actions").delete_buffer,
    }

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("undo")
    require('telescope').setup {
      defaults = {
        mappings = { n = default_maps, i = default_maps, },
        layout_strategy = 'flex',
        layout_config = { prompt_position = 'top', },
        sorting_strategy = 'ascending',
      },
      extensions = {
        file_browser = { respect_gitignore = false, hidden = true, },
      },
      pickers = {
        lsp_references = { path_display = { 'shorten' }, },
        buffers = { mappings = { n = buffers_maps, i = buffers_maps } }
      }
    }
  end
}
