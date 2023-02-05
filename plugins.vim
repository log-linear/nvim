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
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'karoliskoncevicius/vim-sendtowindow'
Plug 'ibhagwan/fzf-lua'
Plug 'mcchrish/zenbones.nvim'
Plug 'echasnovski/mini.nvim'
Plug 'NvChad/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'David-Kunz/markid'
Plug 'yioneko/nvim-yati', { 'tag': '*' }
Plug 'L3MON4D3/LuaSnip'
Plug 'honza/vim-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'rcarriga/cmp-dap'
Plug 'hrsh7th/cmp-cmdline'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/nvim-cmp'
Plug 'danymat/neogen'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'neovim/nvim-lspconfig'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'jghauser/shade.nvim'
call plug#end()

"------------------- karoliskoncevicius/vim-sendtowindow -----------------------
let g:sendtowindow_use_defaults=0
nmap <A-CR> <Plug>SendDown
vmap <A-CR> <Plug>SendDownV
imap <A-CR> <Esc><Plug>SendDown

"----------------------------- ibhagwan/fzf-lua --------------------------------
nn <leader><leader><leader> :FzfLua<CR>
nn <leader><leader>f :FzfLua files<CR>
nn <leader><leader><leader>f <cmd>lua require('fzf-lua').files({cmd = "fd --unrestricted"})<CR>
nn <leader><leader>g :FzfLua git_files<CR>
nn <leader><leader>c :FzfLua git_bcommits<CR>
nn <leader><leader>b :FzfLua buffers<CR>
nn <leader>/ :FzfLua blines<CR>
nn <leader><leader>h :FzfLua help_tags<CR>
nn <leader><leader>o :FzfLua oldfiles<CR>
nn <leader><leader>/ :FzfLua live_grep<CR>
nn <leader><leader><leader>/ <cmd>lua require('fzf-lua').live_grep({cmd = "rg --no-ignore --hidden"})<cr>
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

"============================ lua plugin configs ===============================
if !empty(glob(stdpath('config') . '/plugins.lua'))
  exec 'source ' . stdpath('config') . '/plugins.lua'
endif

