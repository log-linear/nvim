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
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Mason interop
    require("mason-lspconfig").setup()

    -- Global mappings.
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Buffer local options
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>bf', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })

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
      ruff_lsp = {},
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
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 }
      }
      server_opts = vim.tbl_deep_extend('force', server_opts, user_opts)

      require('lspconfig')[server].setup(server_opts)
    end
  end
}
