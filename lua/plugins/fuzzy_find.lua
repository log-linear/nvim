return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = 'make', },
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>",                                                           desc = "Telescope: Files" },
    { "<leader>fF", "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>", desc = "Telescope: All files" },
    { "<leader>gf", "<cmd>Telescope git_files<CR>",                                                            desc = "Telescope: Git files" },
    { "<leader>gc", "<cmd>Telescope git_bcommits<CR>",                                                         desc = "Telescope: Browse current buffer git commits" },
    { "<leader>bl", "<cmd>Telescope buffers<CR>",                                                              desc = "Telescope: Switch buffer" },
    { "<leader>%",  "<cmd>Telescope current_buffer_fuzzy_find<CR>",                                            desc = "Telescope: Fuzzy search current buffer" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",                                                            desc = "Telescope: Help tags" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>",                                                             desc = "Telescope: Old files" },
    { "<leader>/",  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",            desc = "Telescope: Live grep search" },
    { "<leader>*",  "<cmd>Telescope grep_string<CR>",                                                          desc = "Telescope: grep search word under cursor" },
    { "<leader>:",  "<cmd>Telescope commands<CR>",                                                             desc = "Telescope: Commands" },
    { "<leader>fm", "<cmd>Telescope keymaps<CR>",                                                              desc = "Telescope: Keymaps" },
    { "<leader>ft", "<cmd>Telescope filetypes<CR>",                                                            desc = "Telescope: Set filetype" },
    { "gr",         "<cmd>Telescope lsp_references<CR>",                                                       desc = "Telescope: Show LSP references" },
    { "<leader>u",  "<cmd>Telescope undo<CR>",                                                                 desc = "Telescope: Show undo tree" },
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
