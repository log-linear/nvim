"=========================== viml plugin configs ===============================
let g:python3_host_prog=expand(stdpath("config") . '/venv/bin/python3')
if has("win64") || has("win32") || has("win16")
  let g:python3_host_prog=expand(stdpath("config") . '/venv/Scripts/python')
endif

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
Plug 'ms-jpq/coq_nvim', { 'branch': 'coq' }
Plug 'ms-jpq/coq.artifacts', { 'branch': 'artifacts' }
Plug 'TaDaa/vimade', { 'on': 'VimadeEnable' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'm-demare/hlargs.nvim'
Plug 'David-Kunz/markid'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'neovim/nvim-lspconfig'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
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
nn <leader><leader> :Telescope<CR>
nn <leader>ff :Telescope find_files<CR>
nn <leader>af <cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<cr>
nn <leader>gf :Telescope git_files<CR>
nn <leader>gc :Telescope git_bcommits<CR>
nn <leader>bl :Telescope buffers<CR>
nn <leader>/ :Telescope current_buffer_fuzzy_find<CR>
nn <leader>of :Telescope oldfiles<CR>
nn <leader>rg :Telescope live_grep<CR>
nn <leader>arg <cmd>lua require('telescope.builtin').live_grep({additional_args = function() return { "--no-ignore", "--hidden" } end})<CR>
nn <leader>wg :Telescope grep_string<CR>
nn <leader>awg <cmd>lua require('telescope.builtin').grep_string({additional_args = function() return { "--no-ignore", "--hidden" } end})<CR>
nn <leader>km :Telescope keymaps<CR>
nn <leader>ft :Telescope filetypes<CR>
nn <leader>fr :Telescope lsp_references<CR>

"----------------------------- ms-jpq/coq_nvim ---------------------------------
let g:coq_settings = {
\   'auto_start': 'shut-up',
\   'keymap': {
\     'recommended': v:false,
\     'manual_complete': '<c-l>',
\     'bigger_preview': '<c-j>',
\     'jump_to_mark': '<c-h>',
\   }
\ }
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

"------------------------------- TaDaa/vimade ----------------------------------
let g:vimade = {
  \ 'enabletreesitter': 1
\ }
" Lazy load
autocmd BufNew * ++once if !exists('g:vimade_loaded') |
\ exec 'VimadeEnable' | endif
autocmd FocusLost * ++once if !exists('g:vimade_loaded') |
\ exec 'VimadeEnable' | call vimade#FocusLost() | endif

"============================ lua plugin configs ===============================
if !empty(glob(stdpath('config') . '/plugins.lua'))
  exec 'source ' . stdpath('config') . '/plugins.lua'
endif

