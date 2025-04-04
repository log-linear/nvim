
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason interop
      require("mason-lspconfig").setup()

      -- Mappings
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
      }
    end
  },

  -------------------------- Embedded lsp support -----------------------------
  {
    'jmbuhr/otter.nvim',
    keys = {
      { "<leader>ot", ":lua require'otter'.activate()<CR>", desc = "Otter.nvim: Enable nested LSP"}
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },
  ---------------------------- LSP reference nav -------------------------------
  {
    "folke/snacks.nvim",
    priority = 1000,
    keys = {
      -- Reference jumping
      { "]r", ":lua Snacks.words.jump(1, false)<CR>",  { desc = "Next reference" } },
      { "[r", ":lua Snacks.words.jump(-1, false)<CR>", { desc = "Previous reference" } },
    },
    lazy = false,
    ---@type snacks.Config
    opts = {
      words = { enabled = true },
    },
  },

  ---------------------------- Turn off idle LSPs ------------------------------
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- your options here
    }
  },
}
