--================================= Plugins ====================================
return {
  ------------------------------- Package manager ------------------------------
  { "folke/lazy.nvim", version = "*", },

  --------------------------------- Git support --------------------------------
  { "tpope/vim-fugitive" },

  ------------------------------- file manager ---------------------------------
  {
    'stevearc/oil.nvim',
    config = function()
      require("oil").setup({
        keymaps = {
          ["<C-s>"] = "actions.select_split",
          ["<C-v>"] = "actions.select_vsplit",
        },
      })
      vim.keymap.set("n", "<leader>fm", ":vnew +Oil<CR><C-W>H")
    end
  },

  -------------------------- git markers in gutter -----------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    -- event = "VeryLazy",
    config = function()
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
    end
  },

  ---------------------------------- Databases ---------------------------------
  {
    "tpope/vim-dadbod",
    ft = "sql",
    dependencies = { "kristijanhusak/vim-dadbod-completion", }
  },

  ------------------------------------- REPL -----------------------------------
  {
    "karoliskoncevicius/vim-sendtowindow",
    keys = {
      { "<A-CR>", "<Plug>SendDown" },
      { "<A-CR>", "<Plug>SendDownV" },
      { "<A-CR>", "<Esc><Plug>SendDown" },
    },
    config = function() vim.g.sendtowindow_use_defaults = 0 end
  },

  --------------------------------- Fuzzy finder -------------------------------
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader><leader>", "<cmd>FzfLua<CR>" },
      { "<leader><leader>f", "<cmd>FzfLua files<CR>" },
      { "<leader><leader>F", "<cmd>lua require('fzf-lua').files({cmd = 'fd --unrestricted'})<CR>" },
      { "<leader><leader>g", "<cmd>FzfLua git_files<CR>" },
      { "<leader><leader>c", "<cmd>FzfLua git_bcommits<CR>" },
      { "<leader><leader>b", "<cmd>FzfLua buffers<CR>" },
      { "<leader>/", "<cmd>FzfLua blines<CR>" },
      { "<leader><leader>h", "<cmd>FzfLua help_tags<CR>" },
      { "<leader><leader>o", "<cmd>FzfLua oldfiles<CR>" },
      { "<leader><leader>/", "<cmd>FzfLua live_grep<CR>" },
      { "<leader><leader>?", "<cmd>lua require('fzf-lua').live_grep({cmd = 'rg -uuu'})<cr>" },
      { "<leader><leader>w", "<cmd>FzfLua grep_cword<CR>" },
      { "<leader><leader>k", "<cmd>FzfLua keymaps<CR>" },
      { "<leader><leader>t", "<cmd>FzfLua filetypes<CR>" },
      { "<leader><leader>r", "<cmd>FzfLua lsp_references<CR>" },
    }
  },

  --------------------------------- Colorscheme --------------------------------
  {
    "mcchrish/zenbones.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "light"
      vim.g.zenwritten_compat = 1
      vim.cmd.colorscheme("zenwritten")
      vim.cmd.highlight({ "Comment", "gui=NONE" })
      vim.cmd.highlight({ "Type", "guifg=#5F5F5F" })
      vim.cmd.highlight({ "link", "NormalNC", "Normal" })
      vim.cmd.highlight({ "ColorColumn", "guibg=#E5E5E5", })
      vim.cmd [[
          let fts = [ 'sh', 'r', 'sql', 'rmd', 'bash' ]
          au BufEnter * if index(fts, &ft) > 0 | hi Function guifg=#5C5C5C gui=bold | endif
          au BufLeave * if index(fts, &ft) > 0 | hi Function guifg=#353535 gui=NONE | endif
      ]]
    end
  },

  ---------------------------------- Auto-pairs --------------------------------
  {
    "windwp/nvim-autopairs",
    keys = {
      { "]tp", ":lua require('nvim-autopairs').enable()<CR>"},
      { "[tp", ":lua require('nvim-autopairs').disable()<CR>"}
    },
    event = "InsertEnter",
    config = function() require('nvim-autopairs').setup({}) end
  },

  ----------------------------------- Surround ---------------------------------
  {
    "machakann/vim-sandwich",
    keys = {
      { "ys", "<Plug>(sandwich-add)", },
      { "cs", "<Plug>(sandwich-replace)", },
      { "ds", "<Plug>(sandwich-delete)", },
      { "ys", "<Plug>(sandwich-add)", mode = "v" },
      { "cs", "<Plug>(sandwich-replace)", mode = "v" },
      { "ds", "<Plug>(sandwich-delete)", mode = "v" },
    }
  },

  ---------------------------------- Align text --------------------------------
  {
    "junegunn/vim-easy-align",
    keys = {
      { "ga", "<Plug>(EasyAlign)", "n" },
      { "ga", "<Plug>(EasyAlign)", "x" },
    },
  },

  ---------------------------- Comment/uncomment code --------------------------
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function() require("Comment").setup({}) end
  },

  -------------- Highlight text backgrounds with matching hex color ------------
  {
    "NvChad/nvim-colorizer.lua",
    keys = { { "<leader>co", ":ColorizerToggle<CR>" } },
    config = function() require 'colorizer'.setup({}) end
  },

  ----------------------------- Indent detection -------------------------------
  { "Darazaki/indent-o-matic", lazy = false },

  ---------------------------------- Treesitter --------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "David-Kunz/markid",
      "yioneko/nvim-yati",
    },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = 'all',
        ignore_install = { "t32" },
        highlight = { enable = true, },
        markid = {
          enable = true,
          colors = {
            "#4d1400",
            "#003fa8",
            "#dc0019",
            "#1e79ce",
            "#a53400",
            "#211866",
            "#007c30",
            "#930091",
            "#008069",
            "#e42358",
            "#203200",
            "#b8005a",
            "#5c799e",
            "#a46a1c",
            "#87005b",
            "#573800",
            "#3c1f36",
            "#840019",
            "#93675f",
            "#481223",
          }
        },
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
      vim.keymap.set("n", "[tt", ":TSDisable highlight<CR>:TSDisable markid<CR>:TSDisable indent<CR>:TSDisable yati<CR>")
      vim.keymap.set("n", "]tt", ":TSEnable highlight<CR>:TSEnable markid<CR>:TSEnable indent<CR>:TSEnable yati<CR>")
    end,
  },

  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  ----------------------------------- Snippets ---------------------------------
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "honza/vim-snippets",
      config = function()
        require("luasnip.loaders.from_snipmate").lazy_load()
      end,
    },
    keys = {
      { "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, mode = "i", },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  ------------------------------- Auto-completion ------------------------------
  {
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
      local get_bufnrs = function() return vim.api.nvim_list_bufs() end

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
          { name = 'buffer', option = { get_bufnrs = get_bufnrs } },
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
  },

  ------------------------- Easy code doc generation ---------------------------
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>doc",
        ":lua require('neogen').generate()<CR>",
        noremap = true,
      }
    },
    config = function()
      require('neogen').setup({ snippet_engine = "luasnip" })
    end
  },

  ---------------------------------- Debuggers ---------------------------------
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dc", ":lua require'dap'.continue()<CR>", },
      { "<Leader>dT", ":lua require'dap'.terminate()<CR>", },
      { "<leader>dp", ":lua require'dap'.pause()<CR>", },
      { "<leader>dso", ":lua require'dap'.step_over()<CR>", },
      { "<leader>dsi", ":lua require'dap'.step_into()<CR>", },
      { "<leader>dsx", ":lua require'dap'.step_out()<CR>", },
      { "<Leader>d.", ":lua require'dap'.toggle_breakpoint()<CR>", },
      { "<Leader>dr", ":lua require'dap'.repl.open()<CR>", },
      { "<Leader>dl", ":lua require'dap'.run_last()<CR>", },
      { "<leader>dtm", ":lua require('dap-python').test_method())", },
      { "<leader>dtc", ":lua require('dap-python').test_class())", },
      { "<leader>ds", ":lua require('dap-python').debug_selection()<CR>)", },
    },
    dependencies = { "mfussenegger/nvim-dap-python" },
    config = function()
      require('dap-python').setup(vim.api.nvim_list_runtime_paths()[1] .. "/venv/bin/python")
      vim.fn.sign_define('DapBreakpoint', { text = '⦿', texthl = '', linehl = '', numhl = '' })
    end
  },

  ------------------------------------- LSP ------------------------------------
  {
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
        vim.keymap.set('n', '<space>ca', ':FzfLua lsp_code_actions<CR>', bufopts)
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
              sh = { {
                formatCommand = 'shfmt -ci -s -bn'
              } },
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
  },

  --------------------------- Highlight indented lines -------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("indent_blankline").setup { show_current_context = true }
    end
  },

  -------------------------- Dim inactive window splits ------------------------
  {
    "levouh/tint.nvim",
    event = "WinNew",
    config = function() require("tint").setup({ tint = 65, }) end
  },

  ------------------------- Distraction-free writing ---------------------------
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>zm", ":ZenMode<CR>" } },
    config = function()
      require("zen-mode").setup{
        window = {
          backdrop = 1,
          width = 80,
          options = {
            signcolumn = "yes",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            colorcolumn = "0"
          }
        },
        plugins = { gitsigns = { enabled = true } }
      }
    end
  },

}
