let mapleader=" "
let g:python3_host_prog = expand(stdpath("config") . '/venv/bin/python3')
if has("win64") || has("win32") || has("win16")
  let g:python3_host_prog = expand(stdpath("config") . '/venv/Scripts/python')
endif

"================================== Plug-ins ===================================
" Auto-install vim-plug
if empty(stdpath("config") . '/site/autoload/plug.vim')
  silent !curl -fLo stdpath("config") . '/site/autoload/plug.vim' --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Load plugins
call plug#begin(stdpath("config") . '/plugged')
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
  map <leader>hu :SignifyHunkUndo<CR>
  map <leader>hd :SignifyHunkDiff<CR>
  let g:signify_priority = 5
  let g:signify_sign_add    = '▊'
  let g:signify_sign_change = '▊'
Plug 'karoliskoncevicius/vim-sendtowindow'
  nmap <A-CR> <Plug>SendDown
  vmap <A-CR> <Plug>SendDownV
  imap <A-CR> <Esc><Plug>SendDown
Plug 'machakann/vim-sandwich'
  exec 'source ' . stdpath("config") .
  \ '/plugged/vim-sandwich/macros/sandwich/keymap/surround.vim'
Plug 'junegunn/vim-easy-align'
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
  nn <leader><leader><leader> :Telescope<CR>
  nn <leader><leader>f :Telescope find_files<CR>
  nn <leader><leader>g :Telescope git_files<CR>
  nn <leader><leader>c :Telescope git_bcommits<CR>
  nn <leader><leader>b :Telescope buffers<CR>
  nn <leader><leader>o :Telescope oldfiles<CR>
  nn <leader><leader>/ :Telescope current_buffer_fuzzy_find<CR>
  nn <leader><leader>m :Telescope keymaps<CR>
  nn <leader><leader>t :Telescope filetypes<CR>
  nn <leader><leader>r :Telescope lsp_references<CR>
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'ms-jpq/coq_nvim', { 'branch': 'coq' }
  let g:coq_settings = {
  \ 'auto_start': 'shut-up',
  \ 'keymap': {
    \ 'recommended': v:false,
    \ 'manual_complete': '<c-l>',
    \ 'bigger_preview': '<c-j>',
    \ 'jump_to_mark': '<c-h>',
  \ }
\ }
  ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
  ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
  ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
Plug 'ms-jpq/coq.artifacts', { 'branch': 'artifacts' }
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'sainnhe/gruvbox-material'
  let g:gruvbox_material_palette = 'original'
  let g:gruvbox_material_enable_bold = 1
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/zen-mode.nvim'
  nn <leader>z :ZenMode<CR>
Plug 'TaDaa/vimade', { 'on': 'VimadeEnable' }
  let g:vimade = {
  \ 'enabletreesitter': 1
\ }
  " Lazy load
  autocmd BufNew * ++once if !exists('g:vimade_loaded') |
  \ exec 'VimadeEnable' | endif
  autocmd FocusLost * ++once if !exists('g:vimade_loaded') |
  \ exec 'VimadeEnable' | call vimade#FocusLost() | endif
call plug#end()

"============================== General settings ===============================
set cursorline
filetype plugin indent on
set clipboard+=unnamedplus
set splitbelow splitright
set mouse=a
set scrolloff=3 sidescroll=3
set number relativenumber
set hidden
set signcolumn=auto:2
set autoindent smartindent
set expandtab tabstop=4 shiftwidth=4
set termguicolors
colorscheme gruvbox-material         " Must load AFTER termguicolors
set list lcs+=tab:\▸\ ,extends:→,precedes:←,nbsp:·,trail:·
au WinEnter term://* :startinsert
au TextYankPost * silent! lua vim.highlight.on_yank({timeout = 250})
set incsearch showmatch hlsearch ignorecase smartcase
set colorcolumn=80
set nowrap
highlight ColorColumn ctermbg=238
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_banner = 0

"================================== Mappings ===================================
nmap <esc> :noh<CR>
nn <leader>s :%s//g<left><left>
xn <leader>s :s//g<left><left>
ino ;B <esc>0D80A=<esc>0:exec "normal! 0r" . &cms<cr>o<bs>
ino ;b <esc>0D80A-<esc>0:exec "normal! 0r" . &cms<cr>o<bs>
ino ;H <esc>:center<cr>2hv0r=A<space><esc>40A=<esc>d80<bar>0:exec "normal! 0r" . &cms<cr><esc>o<bs>
ino ;h <esc>:center<cr>2hv0r-A<space><esc>40A-<esc>d80<bar>0:exec "normal! 0r" . &cms<cr><esc>o<bs>
ino ;todo <esc>:exec "normal! 0i" . &cms[0]<cr>$a TODO: 
nn <cr><cr> :w<CR> :15sp<CR> :term compile %<CR>
nn <leader>tt :15new<CR><C-\><C-n>:call termopen("zsh")<CR><C-\><C-n><C-w>k
nn <leader>tp :15new<CR><C-\><C-n>:call termopen("python")<CR><C-\><C-n><C-w>k
nn <leader>tr :15new<CR><C-\><C-n>:call termopen("radian")<CR><C-\><C-n><C-w>k
nn <Leader>ve <esc>:Vexplore<CR>
nn <leader>cd :cd %:p:h<CR>:pwd<CR>

for mapcmd in ['nn', 'ino', 'vn', 'tno']
  exec mapcmd . ' <A-h> <C-\><C-n><C-w>h'
  exec mapcmd . ' <A-j> <C-\><C-n><C-w>j'
  exec mapcmd . ' <A-k> <C-\><C-n><C-w>k'
  exec mapcmd . ' <A-l> <C-\><C-n><C-w>l'
  exec mapcmd . ' <A-H> <C-\><C-n><C-w>H'
  exec mapcmd . ' <A-J> <C-\><C-n><C-w>J'
  exec mapcmd . ' <A-K> <C-\><C-n><C-w>K'
  exec mapcmd . ' <A-L> <C-\><C-n><C-w>L'
  exec mapcmd . ' <A-,> <C-\><C-n><C-w>:vertical resize -3<CR>'
  exec mapcmd . ' <A--> <C-\><C-n><C-w>:resize -3<CR>'
  exec mapcmd . ' <A-=> <C-\><C-n><C-w>:resize +3<CR>'
  exec mapcmd . ' <A-.> <C-\><C-n><C-w>:vertical resize +3<CR>'
  exec mapcmd . ' <A-0> <C-\><C-n><C-w>='
  exec mapcmd . ' <A-q> <C-\><C-n>:q<CR>'
  exec mapcmd . ' <A-Q> <C-\><C-n>:q!<CR>'
  exec mapcmd . ' <A-d> <C-\><C-n>:bd<CR>'
  exec mapcmd . ' <A-D> <C-\><C-n>:bd!<CR>'
  exec mapcmd . ' <A-n> <C-\><C-n>:bn<CR>'
  exec mapcmd . ' <A-p> <C-\><C-n>:bp<CR>'
  exec mapcmd . ' <A-s> <C-\><C-n>:sp<CR>'
  exec mapcmd . ' <A-v> <C-\><C-n>:vs<CR>'
endfor

"=========================== File-specific settings ============================
let g:pyindent_open_paren=4
let g:markdown_fenced_languages = ['python', 'r', 'sh', 'bash', 'zsh', 
\ 'powershell=ps1', 'sql', 'json', 'html', 'css']
let r_indent_align_args = 0
let g:r_indent_op_pattern = get(g:, 'r_indent_op_pattern',
\ '\(&\||\|+\|-\|\*\|/\|=\|\~\|%\|->\||>\)\s*$')

au FileType sh,bash,zsh setlocal shiftwidth=2 tabstop=2
au FileType r,rmd setlocal shiftwidth=2 tabstop=2 autoindent cindent
au FileType vim setlocal shiftwidth=2 tabstop=2
au FileType lua setlocal shiftwidth=2 tabstop=2
au BufEnter *.tsv setlocal noexpandtab
for mapcmd in ['ino', 'tno']
  exec 'au FileType sh,bash,zsh,tex,r,rmd ' . mapcmd . ' ;s $'
  exec 'au FileType r,rmd ' . mapcmd . ' ;; <-'
  exec 'au FileType r,rmd ' . mapcmd . ' ;n \|>'
  exec 'au FileType r,rmd ' . mapcmd . ' ;m %>%'
  exec 'au FileType r,rmd ' . mapcmd . ' ;in %in%'
  exec 'au FileType r,rmd ' . mapcmd . ' ;r %%'
  exec 'au FileType r,rmd ' . mapcmd . ' ;v <space>\|> vd()'
  exec 'au FileType r,rmd ' . mapcmd . ' ;c <space>\|> colnames()'
  exec 'au FileType r,rmd ' . mapcmd . ' ;o objs()'
  exec 'au FileType python ' . mapcmd . ' ;. ->'
endfor
au FileType markdown,rmd ino ;e **<left>
au FileType markdown,rmd ino ;H <esc>yypv$r=o
au FileType markdown,rmd ino ;h <esc>yypv$r-o
au FileType tex,markdown nn <cr>x :w<CR> :15sp<CR> :term compile % x && rm "%:r.aux" "%:r.log" & xdg-open %:r.pdf<CR>
au FileType tex,markdown nn <cr>p :w<CR> :15sp<CR> :term compile % p && rm "%:r.aux" "%:r.log" & xdg-open %:r.pdf<CR>
au FileType tex,markdown nn <cr>h :w<CR> :15sp<CR> :term compile % h && xdg-open %:r.html<CR>
au FileType tex,markdown nn <cr>d :w<CR> :15sp<CR> :term compile % d && xdg-open %:r.docx<CR> 
au FileType tex ino ;; \

"============================ Additional settings ==============================
lua require('config')

if has("win64") || has("win32") || has("win16")
  exec 'source ' . stdpath("config") . '/win.vim'
endif

if !empty(glob(stdpath("config") . '/work.vim'))
  exec 'source ' . stdpath("config") . '/work.vim'
endif

