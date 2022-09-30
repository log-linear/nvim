--============================ lua plugin configs ==============================

----------------------- nvim-treesitter/nvim-treesitter ------------------------
local m = require'markid'
require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  highlight = { enable = true, },
  markid = {
    enable = false,
    colors = m.colors.dark
  }
}

m.colors = {
  dark = { '#619e9d', '#9E6162', '#81A35C', '#7E5CA3', '#9E9261', '#616D9E', '#97687B', '#689784', '#999C63', '#66639C', '#967869', '#698796', '#9E6189', '#619E76' },
  bright = { '#f5c0c0', '#f5d3c0', '#f5eac0', '#dff5c0', '#c0f5c8', '#c0f5f1', '#c0dbf5', '#ccc0f5', '#f2c0f5' },
  medium = {'#c99d9d', '#c9a99d', '#c9b79d', '#c9c39d', '#bdc99d', '#a9c99d', '#9dc9b6', '#9dc2c9', '#9da9c9', '#b29dc9', '#c99dc1' }
}
vim.keymap.set('n', '<space>m', ':TST markid<CR>')

----------------------------- m-demare/hlargs.nvim -----------------------------
require('hlargs').setup {
  use_colorpalette = true,
  colorpalette = {
    { fg = '#619e9d' },
    { fg = '#9E6162' },
    { fg = '#81A35C' },
    { fg = '#7E5CA3' },
    { fg = '#9E9261' },
    { fg = '#616D9E' },
    { fg = '#97687B' },
    { fg = '#689784' },
    { fg = '#999C63' },
    { fg = '#66639C' },
    { fg = '#967869' },
    { fg = '#698796' },
    { fg = '#9E6189' },
    { fg = '#619E76' },
  },
  declarations = {
    python = { 'self', 'cls' },
    lua = { 'self' }
  },
  usages = {
    python = { 'self', 'cls' },
    lua = { 'self' }
  }
}

--------------------------- ellisonleao/gruvbox.nvim ---------------------------
local colors = require('gruvbox.palette')
require('gruvbox').setup({
  contrast = "hard",
  overrides = {
    SignColumn = { bg = colors.light0_hard },
    GruvboxRedSign = { fg = colors.red, bg = colors.light0_hard, reverse = false },
    GruvboxGreenSign = { fg = colors.green, bg = colors.light0_hard, reverse = false },
    GruvboxYellowSign = { fg = colors.yellow, bg = colors.light0_hard, reverse = false },
    GruvboxBlueSign = { fg = colors.blue, bg = colors.light0_hard, reverse = false },
    GruvboxPurpleSign = { fg = colors.purple, bg = colors.light0_hard, reverse = false },
    GruvboxAquaSign = { fg = colors.aqua, bg = colors.light0_hard, reverse = false },
    GruvboxOrangeSign = { fg = colors.orange, bg = colors.light0_hard, reverse = false },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = false },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = false },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = false },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = false },
    Operator = { fg = colors.orange, italic = false },
  }
})
vim.cmd("set bg=light")
vim.cmd("colorscheme gruvbox")

---------------------------- numToStr/Comment.nvim -----------------------------
require('Comment').setup {}

------------------------ nvim-telescope/telescope.nvim -------------------------
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

---------------------------- neovim/nvim-lspconfig -----------------------------
-- Mappings
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl',
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>fo', vim.lsp.buf.formatting, bufopts)
end

-- LSP-built-in snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Set diagnostics UI
local signs = { Error = "⮿", Warn = "⚠", Hint = "⯑", Info = "🛈" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({ virtual_text = false, })

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  pyright = {},
  r_language_server = { settings = { rich_documentation = false } },
  bashls = {},
  texlab = {},
  jsonls = {},
  cssls = {},
  html = {},
  vimls = {},
  sqls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        -- Settings for use with nvim
        runtime = { version = 'LuaJIT', },
        diagnostics = { globals = { 'vim' }, },
        workspace = { library = vim.api.nvim_get_runtime_file('', true), },
        telemetry = { enable = false, },
      },
    },
  },
  efm = {
    init_options = { documentFormatting = true },
    settings = {
      rootMarkers = { ".git/" },
      languages = {
        python = {
          {
            formatCommand = "black --quiet --line-length=80 -",
            formatStdin = true
          },
        }
      }
    },
    filetypes = { 'python', }
  },
  openscad_ls = {}
}
for server, user_opts in pairs(servers) do
  local server_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 }
  }
  server_opts = vim.tbl_deep_extend('force', server_opts, user_opts)

  require('lspconfig')[server].setup(
    require('coq').lsp_ensure_capabilities(server_opts)
  )
end

---------------------------- windwp/nvim-autopairs -----------------------------
-- Configs to handle coq_nvim compatibility
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false, map_cr = false })

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })

--------------------------- lewis6991/gitsigns.nvim ----------------------------
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line { full = true } end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
