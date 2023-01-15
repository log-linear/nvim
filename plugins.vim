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
Plug 'ms-jpq/coq.thirdparty'
Plug 'TaDaa/vimade', { 'on': 'VimadeEnable' }
Plug 'ibhagwan/fzf-lua'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
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
nn <leader>f :FzfLua<CR>
nn <leader>ff :FzfLua files<CR>
nn <leader>fF <cmd>lua require('fzf-lua').files({cmd = "fd --unrestricted"})<cr>
nn <leader>fgf :FzfLua git_files<CR>
nn <leader>fc :FzfLua git_bcommits<CR>
nn <leader>fb :FzfLua buffers<CR>
nn <leader>f/ :FzfLua blines<CR>
nn <leader>fh :FzfLua help_tags<CR>
nn <leader>fo :FzfLua oldfiles<CR>
nn <leader>fs :FzfLua live_grep<CR>
nn <leader>fS <cmd>lua require('fzf-lua').live_grep({cmd = "rg --no-ignore --hidden"})<cr>
nn <leader>fw :FzfLua grep_cword<CR>
nn <leader>fk :FzfLua keymaps<CR>
nn <leader>ft :FzfLua filetypes<CR>
nn <leader>fr :FzfLua lsp_references<CR>

"----------------------------- ms-jpq/coq_nvim ---------------------------------
let g:coq_settings = {
\   'auto_start': 'shut-up',
\ }

"------------------------------- TaDaa/vimade ----------------------------------
let g:vimade = {
  \ 'enabletreesitter': 1
\ }
" Lazy load
autocmd BufNew * ++once if !exists('g:vimade_loaded') |
\ exec 'VimadeEnable' | endif
autocmd FocusLost * ++once if !exists('g:vimade_loaded') |
\ exec 'VimadeEnable' | call vimade#FocusLost() | endif

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

