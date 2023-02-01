--============================ lua plugin configs ==============================

-------------------------- NvChad/nvim-colorizer.lua ---------------------------
require 'colorizer'.setup()

----------------------- nvim-treesitter/nvim-treesitter ------------------------
require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  highlight = { enable = true, },
  markid = { enable = true },
  indent = {
    enable = true,
    disable = {
      "python",
      "lua",
      "javascript",
      "html",
      "json",
      "toml",
      "c",
      "css",
      "cpp",
      "typescript",
      "rust",
      "vue",
    }
  },
  yati = { enable = true },
}

------------------------------- L3MON4D3/LuaSnip -------------------------------
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

local opts = { silent = true, expr = true }
vim.keymap.set(
  { "s", "i", },
  "<Tab>",
  function()
    if luasnip.expand_or_locally_jumpable()
      then return "<ESC>:lua require('luasnip').expand_or_jump()<CR>i"
    else
      return "<tab>"
    end
  end,
  opts
)
vim.keymap.set(
  { "s", "i" },
  "<S-Tab>",
  function()
    if luasnip.jumpable(-1)
      then return "<ESC>:lua require('luasnip').jump(-1)<CR>i"
    else
      return "<tab>"
    end
  end,
  opts
)

-------------------------------- danymat/neogen --------------------------------
require('neogen').setup({ snippet_engine = "luasnip" })
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>doc", ":lua require('neogen').generate()<CR>", opts)

---------------------------- mfussenegger/nvim-dap -----------------------------
require('dap-python').setup(vim.api.nvim_list_runtime_paths()[1] .. "/venv/bin/python")
vim.fn.sign_define('DapBreakpoint', { text = '⦿', texthl = '', linehl = '', numhl = '' })

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dp", ":lua require'dap'.pause()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dso", ":lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dsi", ":lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dsx", ":lua require'dap'.step_out()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition:'))<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dlp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dn", ":lua require('dap-python').test_method())", opts)
vim.api.nvim_set_keymap("n", "<leader>df", ":lua require('dap-python').test_class())", opts)
vim.api.nvim_set_keymap("n", "<leader>ds", ":lua require('dap-python').debug_selection()<CR>)", opts)

------------------------------ David-Kunz/markid -------------------------------
local m = require 'markid'
m.queries = {
  default = '(identifier) @markid',
  json = '(pair key: (string) @markid)',
  bash = '(variable_name) @markid',
  css = '(property_name) @markid',
  toml = '(bare_key) @markid',
}
vim.api.nvim_set_hl(0, 'markid1', { fg = '#6a295d' })
vim.api.nvim_set_hl(0, 'markid2', { fg = '#365e21' })
vim.api.nvim_set_hl(0, 'markid3', { fg = '#557cbf' })
vim.api.nvim_set_hl(0, 'markid4', { fg = '#896a2a' })
vim.api.nvim_set_hl(0, 'markid5', { fg = '#2f3766' })
vim.api.nvim_set_hl(0, 'markid6', { fg = '#008374' })
vim.api.nvim_set_hl(0, 'markid7', { fg = '#82332c' })
vim.api.nvim_set_hl(0, 'markid8', { fg = '#348d9f' })
vim.api.nvim_set_hl(0, 'markid9', { fg = '#ac7188' })
vim.api.nvim_set_hl(0, 'markid10', { fg = '#174233' })
vim.keymap.set('n', '<space>m', ':TSToggle markid<CR>')

---------------------------- numToStr/Comment.nvim -----------------------------
require('Comment').setup {}

------------------------------- hrsh7th/nvim-cmp -------------------------------
-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  -- Enable in DAP buffers
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        or require("cmp_dap").is_dap_buffer()
  end,

  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'treesitter' }
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  })
})

-- nvim-dap
cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = { { name = "dap" } },
})

---------------------------- neovim/nvim-lspconfig -----------------------------
-- Mappings
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl',
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', ':FzfLua lsp_code_actions<CR>', bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>bf', vim.lsp.buf.format, bufopts)
end

-- LSP-built-in snippet support
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
    server_opts
  )
end

---------------------------- windwp/nvim-autopairs -----------------------------
require("nvim-autopairs").setup {}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require('cmp').event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

--------------------- lukas-reineke/indent-blankline.nvim ----------------------
require("indent_blankline").setup {
  show_current_context = true,
}

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

----------------------------- jghauser/shade.nvim ------------------------------
require("shade").setup()
