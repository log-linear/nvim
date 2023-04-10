return {
  "neovim/nvim-lspconfig",
  event = {
    "FileType python",
    "FileType r",
    "FileType rmd",
    "FileType bash",
    "FileType sh",
    "FileType tex",
    "FileType json",
    "FileType css",
    "FileType html",
    "FileType lua",
    "FileType vim",
    "FileType openscad",
  },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    -- Mappings
    local opts = { noremap = true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      local bufopts = { noremap = true, buffer = bufnr }
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
      vim.keymap.set('n', '<space>bf', vim.lsp.buf.format, bufopts)
      vim.keymap.set('n', ']tl', ':LspStart<CR>', bufopts)
      vim.keymap.set('n', '[tl', ':LspStop<CR>', bufopts)
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
      lua_ls = {
        settings = {
          Lua = {
            -- Settings for use with nvim
            runtime = { version = 'LuaJIT', },
            diagnostics = { globals = { 'vim' }, },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false
            },
            telemetry = { enable = false, },
          },
        },
      },
      efm = {
        init_options = { documentFormatting = true },
        settings = {
          rootMarkers = { ".git/" },
          languages = {
            python = { {
              formatCommand = "black --quiet --line-length=80 -",
              formatStdin = true
            } },
            sh = { { formatCommand = 'shfmt -ci -s -bn' } },
            css = { {
              formatCommand = "prettier ${--tab-width:tabWidth} ${--single-quote:singleQuote} --parser css",
            } }
          }
        },
        filetypes = { 'python', 'css', 'sh', 'bash' }
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

      require('lspconfig')[server].setup(server_opts)
    end
  end
}
