return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
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
        { name = 'path' },
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
}
