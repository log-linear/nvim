--============================= General settings ===============================
vim.keymap.set('n', '[D', function() vim.diagnostic.enable(false) end, { desc = "LSP: Disable disagnostics" })
vim.keymap.set('n', ']D', function() vim.diagnostic.enable(true) end, { desc = "LSP: Disable disagnostics" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "LSP: Go to declaration" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP: Hover definition" })
vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help, { desc = "LSP: Signature help" })

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

--========================= Enable language servers ============================
vim.lsp.enable({
  "basedpyright",
  "ruff",
  "lua_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "html",
  "css",
  "r_language_server",
  "azure_pipelines_ls",
  "dockerls",
  "docker_compose_language_service",
  "vimls",
  "dotls",
})

--=========================== LS-specific settings =============================

------------------------------------ lua_ls ------------------------------------
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

--------------------------------- basedpyright ---------------------------------
vim.lsp.config("basedpyright", {})

-- ----------------------------- rainbow highlighting -----------------------------
-- -- Adapted from https://github.com/goldos24/rainbow-variables-nvim
-- vim.o.termguicolors = true
-- vim.api.nvim_set_hl(0, "VarName0",  { fg = "#7b2f00" })
-- vim.api.nvim_set_hl(0, "VarName1",  { fg = "#003fa8" })
-- vim.api.nvim_set_hl(0, "VarName2",  { fg = "#dc0019" })
-- vim.api.nvim_set_hl(0, "VarName3",  { fg = "#1e79ce" })
-- vim.api.nvim_set_hl(0, "VarName4",  { fg = "#a53400" })
-- vim.api.nvim_set_hl(0, "VarName5",  { fg = "#004e73" })
-- vim.api.nvim_set_hl(0, "VarName6",  { fg = "#007c30" })
-- vim.api.nvim_set_hl(0, "VarName7",  { fg = "#930091" })
-- vim.api.nvim_set_hl(0, "VarName8",  { fg = "#558500" })
-- vim.api.nvim_set_hl(0, "VarName9",  { fg = "#e42358" })
-- vim.api.nvim_set_hl(0, "VarName10", { fg = "#005c0e" })
-- vim.api.nvim_set_hl(0, "VarName11", { fg = "#b8005a" })
-- vim.api.nvim_set_hl(0, "VarName12", { fg = "#5c799e" })
-- vim.api.nvim_set_hl(0, "VarName13", { fg = "#a46a1c" })
-- vim.api.nvim_set_hl(0, "VarName14", { fg = "#87005b" })
-- vim.api.nvim_set_hl(0, "VarName15", { fg = "#c55d00" })
--
--
-- function hashToken(token, buf)
--   local line = vim.api.nvim_buf_get_lines(buf, token.line, token.line + 1, true)[1]
--   local s = string.sub(line, token.start_col + 1, token.end_col)
--   local ret = 0
--   for i = 1, string.len(s), 1 do
--     ret = ((ret * 27) + string.byte(s, i)) % 16
--   end
--   return ret
-- end
--
-- vim.api.nvim_create_autocmd("LspTokenUpdate", {
--   callback = function(args)
--     local token = args.data.token
--     local buf = args.buf
--     local client_id = args.data.client_id
--     if token.type == "variable" then
--       vim.lsp.semantic_tokens.highlight_token(
--         token, buf, client_id,
--         "VarName" .. hashToken(token, buf)
--       )
--     end
--   end
-- })
