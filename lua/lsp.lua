------------------------------- General settings -------------------------------

vim.keymap.set('n', '[D', function() vim.diagnostic.enable(false) end, { desc = "LSP: Disable disagnostics" })
vim.keymap.set('n', ']D', function() vim.diagnostic.enable(true) end, { desc = "LSP: Disable disagnostics" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "LSP: Go to declaration" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP: Hover definition" })
  vim.keymap.set({'n', 'i'}, '<C-s>', vim.lsp.buf.signature_help, { desc = "LSP: Signature help" })

vim.cmd.amenu([[PopUp.LSP:\ Go\ to\ Definition :lua vim.lsp.buf.definition()<CR>]])
vim.cmd.amenu([[PopUp.LSP:\ Show\ References :lua require("snacks").picker.lsp_references()<CR>]])
vim.cmd.amenu([[PopUp.LSP:\ Rename :lua vim.lsp.buf.rename()<CR>]])
vim.cmd.amenu([[PopUp.LSP:\ Code\ Actions :lua vim.lsp.buf.code_action()<CR>]])

-- Set diagnostics UI
local signs = { Error = "⮿", Warn = "⚠", Hint = "⯑", Info = "🛈" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({ virtual_text = false, })

--------------------------- Enable language servers ----------------------------
vim.lsp.enable({
  "basedpyright",
  "ruff",
  "lua_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "html",
  "css",
})

----------------------------- LS-specific settings -----------------------------
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        }
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = {
        --   vim.api.nvim_get_runtime_file('', true),
        -- }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

