"=========================== viml plugin configs ===============================
" Auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'karoliskoncevicius/vim-sendtowindow'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/vim-easy-align'
Plug 'ibhagwan/fzf-lua'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'rcarriga/cmp-dap'
Plug 'yioneko/nvim-yati'
Plug 'danymat/neogen'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'David-Kunz/markid'
Plug 'mcchrish/zenbones.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'levouh/tint.nvim'
call plug#end()

"------------------- karoliskoncevicius/vim-sendtowindow -----------------------
let g:sendtowindow_use_defaults=0
nmap <A-CR> <Plug>SendDown
vmap <A-CR> <Plug>SendDownV
imap <A-CR> <Esc><Plug>SendDown

"-------------------------- machakann/vim-sandwich -----------------------------
runtime macros/sandwich/keymap/surround.vim

"------------------------- junegunn/vim-easy-align -----------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"---------------------- nvim-telescope/telescope.nvim --------------------------
nn <leader><leader><leader> :FzfLua<CR>
nn <leader><leader>f :FzfLua files<CR>
nn <leader><leader>F <cmd>lua require('fzf-lua').files({cmd = "fd --unrestricted"})<CR>
nn <leader><leader>g :FzfLua git_files<CR>
nn <leader><leader>c :FzfLua git_bcommits<CR>
nn <leader><leader>b :FzfLua buffers<CR>
nn <leader>/ :FzfLua blines<CR>
nn <leader><leader>h :FzfLua help_tags<CR>
nn <leader><leader>o :FzfLua oldfiles<CR>
nn <leader><leader>s :FzfLua live_grep<CR>
nn <leader><leader>S <cmd>lua require('fzf-lua').live_grep({cmd = "rg --no-ignore --hidden"})<cr>
nn <leader><leader>w :FzfLua grep_cword<CR>
nn <leader><leader>k :FzfLua keymaps<CR>
nn <leader><leader>t :FzfLua filetypes<CR>
nn <leader><leader>r :FzfLua lsp_references<CR>

"-------------------------- mcchrish/zenbones.nvim'  ---------------------------
set background=light
let g:zenwritten_compat = 1
let g:zenwritten_lightness = 'bright'

colorscheme zenwritten
hi ColorColumn guifg=NONE guibg=#E5E5E5 guisp=NONE gui=NONE cterm=NONE
let fts = [ 'sh', 'r', 'sql', 'rmd', 'bash' ]
au BufEnter * if index(fts, &ft) > 0 | hi @function guifg=#5C5C5C guibg=NONE guisp=NONE gui=bold cterm=NONE | endif
au BufLeave * if index(fts, &ft) > 0 | hi @function guifg=#5C5C5C guibg=NONE guisp=NONE gui=NONE cterm=NONE | endif

"-------------------------- mfussenegger/nvim-dap ------------------------------
nn <silent> <leader>dc <Cmd>lua require'dap'.continue()<CR>
nn <silent> <leader>dp <Cmd>lua require'dap'.pause()<CR>
nn <silent> <leader>dso <Cmd>lua require'dap'.step_over()<CR>
nn <silent> <leader>dsi <Cmd>lua require'dap'.step_into()<CR>
nn <silent> <leader>dsx <Cmd>lua require'dap'.step_out()<CR>
nn <silent> <Leader>db <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nn <silent> <Leader>dB <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nn <silent> <Leader>dlp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nn <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nn <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
nn <silent> <leader>dn :lua require('dap-python').test_method()<CR>
nn <silent> <leader>df :lua require('dap-python').test_class()<CR>
vno <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

"============================ lua plugin configs ===============================
if !empty(glob(stdpath('config') . '/plugins.lua'))
  exec 'source ' . stdpath('config') . '/plugins.lua'
endif

