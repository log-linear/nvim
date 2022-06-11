let mapleader=" "

"================================== Plug-ins ===================================
" Auto-install vim-plug
if empty(stdpath("config") . '/site/autoload/plug.vim')
  silent !curl -fLo stdpath("config") . '/site/autoload/plug.vim' --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Load plugins
call plug#begin(stdpath("config") . '/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
  map <leader>uh :SignifyHunkUndo<CR>
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
  nn <leader>f<leader> :Telescope<CR>
  nn <leader>ff :Telescope find_files<CR>
  nn <leader>fc :Telescope git_bcommits<CR>
  nn <leader>fo :Telescope oldfiles<CR>
  nn <leader>f/ :Telescope current_buffer_fuzzy_find<CR>
  nn <leader>fm :Telescope keymaps<CR>
  nn <leader>ft :Telescope filetypes<CR>
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'ms-jpq/coq_nvim'
  let g:coq_settings = {
  \ 'auto_start': 'shut-up', 
\ }
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'sainnhe/gruvbox-material'
  let g:gruvbox_material_palette = 'original'
  let g:gruvbox_material_enable_bold = 1
Plug 'vim-airline/vim-airline'
  let g:airline_theme = 'gruvbox_material'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline#extensions#scrollbar#enabled = 1 
  let g:airline#extensions#scrollbar#minwidth = 100 
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sunjon/shade.nvim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"============================== General settings ===============================
set cursorline                       " Cursor line highlight
filetype plugin indent on            " filetype detection
set clipboard+=unnamedplus           " Use system clipboard for yank/paste
set splitbelow splitright            " Splits open at the bottom and right
set mouse=a                          " Enable mouse support
set scrolloff=3 sidescroll=3         " Always show 3 horiz/vert lines on scroll
set number relativenumber            " Relative line numbers
set hidden                           " Allow switching buffers before saving
set signcolumn=auto:2                " sign column for gitgutter, lsp, etc
set autoindent smartindent           " autoindent
set expandtab tabstop=4 shiftwidth=4 " tabs to spaces, default 4
set termguicolors                    " Enable 24-bit RGB
colorscheme gruvbox-material         " Colorscheme, load AFTER termguicolors
set list lcs+=tab:\▸\ ,trail:·       " Show tab indentlines, trailing spaces
au WinEnter term://* :startinsert    " Always enter terminals in insert mode
set incsearch showmatch hlsearch ignorecase smartcase
set colorcolumn=80
highlight ColorColumn ctermbg=238
let g:netrw_liststyle = 3                                 " Default to tree-view
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'  " relative line nums
let g:netrw_banner = 0                                    " Remove top banner

"================================== Mappings ===================================
nmap <esc> :noh<CR>
nmap <C-[> :noh<CR>
ino ;B <esc>0D80A=<esc>0:exec "normal! 0r" . &cms[0]<cr>o<bs>
ino ;b <esc>0D80A-<esc>0:exec "normal! 0r" . &cms[0]<cr>o<bs>
ino ;H <esc>:center<cr>2hv0r=A<space><esc>40A=<esc>d80<bar>0:exec "normal! 0r" . &cms[0]<cr><esc>o<bs>
ino ;h <esc>:center<cr>2hv0r-A<space><esc>40A-<esc>d80<bar>0:exec "normal! 0r" . &cms[0]<cr><esc>o<bs>
ino ;todo <esc>:exec "normal! 0i" . &cms[0]<cr>$a TODO: 
nn <leader>cc :w<CR> :exec '!compile "%:p"'<CR>
nn <leader>tt :new<CR><C-\><C-n>:call termopen("zsh")<CR><C-\><C-n><C-w>k
nn <leader>tp :new<CR><C-\><C-n>:call termopen("python")<CR><C-\><C-n><C-w>k
nn <leader>tr :new<CR><C-\><C-n>:call termopen("radian")<CR><C-\><C-n><C-w>k

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
  exec mapcmd . ' <A-f> <C-\><C-n>:Vexplore<CR>'
  exec mapcmd . ' <A-d> <C-\><C-n>:bd<CR>'
  exec mapcmd . ' <A-D> <C-\><C-n>:bd!<CR>'
  exec mapcmd . ' <A-n> <C-\><C-n>:bn<CR>'
  exec mapcmd . ' <A-p> <C-\><C-n>:bp<CR>'
  exec mapcmd . ' <A-s> <C-\><C-n>:split<CR>'
  exec mapcmd . ' <A-v> <C-\><C-n>:vsplit<CR>'
endfor

"=========================== File-specific settings ============================
let g:pyindent_open_paren=4  " 4 spaces after open parentheses in python
let g:markdown_fenced_languages = ['python', 'r', 'sh', 'bash', 'zsh', 
\ 'powershell=ps1', 'sql', 'json', 'html', 'css']  " markdown code fences
let r_indent_align_args = 0  " Don't align R function arguments
let g:r_indent_op_pattern = get(g:, 'r_indent_op_pattern',
\ '\(&\||\|+\|-\|\*\|/\|=\|\~\|%\|->\||>\)\s*$')  " Support |> indenting

au FileType sh,bash,zsh setlocal shiftwidth=2 tabstop=2
au FileType r,rmd setlocal shiftwidth=2 tabstop=2 autoindent cindent
au FileType vim setlocal shiftwidth=2 tabstop=2
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
au FileType tex,markdown nn <leader>cc :w<CR> :exec '!compile "%:p" "'.input('What type of document would you like to compile? Choose from `h` for html, `p` for pdf, `d` for docx, or `x` for a xelatex pdf: ').'"'<CR>
au FileType tex ino ;; \

"============================ Additional settings ==============================
lua require('config')

if has("win64") || has("win32") || has("win16")
  exec 'source ' . stdpath("config") . '\win.vim'
endif

if !empty(glob(stdpath("config") . '/work.vim'))
  exec 'source ' . stdpath("config") . '/work.vim'
endif

