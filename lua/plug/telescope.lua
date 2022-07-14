local maps = {
  ["<A-a>"] = require('telescope.actions').toggle_all
}
require('telescope').setup {
  defaults = {
    mappings = {
      n = maps,
      i = maps,
    },
    layout_strategy = 'flex',
    layout_config = { prompt_position = 'top', },
    sorting_strategy = 'ascending'
  },
  pickers = {
    lsp_references = { path_display = { 'shorten' }, },
  }
}
require('telescope').load_extension('fzf')
