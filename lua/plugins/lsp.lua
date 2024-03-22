return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Mason interop
    require("mason-lspconfig").setup()

    -- Global mappings
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "LSP: Show diagnostics" })
    vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
    vim.keymap.set('n', '[d', function() vim.diagnostic.disable(0) end)
    vim.keymap.set('n', ']d', function() vim.diagnostic.enable(0) end)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Buffer local options
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "LSP: Go to declaration" })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "LSP: Go to definition" })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP: Hover definition" })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "LSP: Go to implementation" })
        vim.keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "LSP: Signature help" })
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "LSP: Add workspace folder" })
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "LSP: Remove workspace folder" })
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = ev.buf, desc = "LSP: List workspace folders" })
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "LSP: Show type definition" })
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP: Rename" })
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "LSP: Show code actions" })
        vim.keymap.set('n', '<space>bf', function()
          vim.lsp.buf.format { async = true }
        end, { buffer = ev.buf, desc = "LSP: Format buffer" })
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

    -- Set-up servers
    local lspconfig = require("lspconfig")
    local server_opts = {
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
    }

    -- Auto set-up any servers installed through Mason
    require("mason-lspconfig").setup_handlers {
      -- Default config
      function(server_name) lspconfig[server_name].setup(server_opts) end,
      -- Custom configs
      ["lua_ls"] = function() lspconfig.lua_ls.setup {
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
        server_opts
      } end,
      ["efm"] = function() lspconfig.efm.setup {
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
        filetypes = { 'python', 'css', 'sh', 'bash' },
        server_opts
      } end,
    }
  end
}
