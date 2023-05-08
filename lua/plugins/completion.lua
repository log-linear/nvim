return {
  ----------------------------- Auto-completion --------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "FelipeLema/cmp-async-path",
      "rcarriga/cmp-dap",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      -- Set up nvim-cmp.
      local cmp = require 'cmp'
      local get_bufnrs = function()
        local bufs = {}
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          bufs[vim.api.nvim_win_get_buf(win)] = true
        end
        return vim.tbl_keys(bufs)
      end

      cmp.setup({
        -- Enable in DAP buffers
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
              or require("cmp_dap").is_dap_buffer()
        end,
        snippet = {
          expand = function(args) require('luasnip').lsp_expand(args.body) end
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<PageDown>'] = cmp.mapping.select_next_item({ count = 15 }),
          ['<PageUp>'] = cmp.mapping.select_prev_item({ count = 15 }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'vim-dadbod-completion' },
          { name = 'luasnip' },
          { name = 'buffer',                 option = { get_bufnrs = get_bufnrs } },
          { name = 'async_path' },
        }),
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'buffer', option = { get_bufnrs = get_bufnrs } },
        })
      })

      -- nvim-dap
      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = { { name = "dap" } },
      })
    end,
  },

  --------------------------------- Snippets -----------------------------------
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "honza/vim-snippets",
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end,
      }
    },
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        mode = "i",
      },
      { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
}
