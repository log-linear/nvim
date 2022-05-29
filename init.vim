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
  let g:sendtowindow_use_defaults=0
  nmap <A-CR> <Plug>SendDown
  vmap <A-CR> <Plug>SendDownV
  imap <A-CR> <Esc><Plug>SendDown
Plug 'machakann/vim-sandwich'
  exec 'source ' . stdpath("config") . 
  \ '/plugged/vim-sandwich/macros/sandwich/keymap/surround.vim'
Plug 'junegunn/vim-easy-align'
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
  nn <leader>/f :Files<CR>
  nn <leader>/g :GFiles<CR>
  nn <leader>/c :BCommits<CR>
  nn <leader>/h :Help<CR>
  nn <leader>/s :History<CR>
  nn <leader>// :BLines<CR>
  nn <leader>/m :Maps<CR>
  nn <leader>/t :Filetypes<CR>
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'ms-jpq/coq_nvim'
  let g:coq_settings = {
  \ 'auto_start': 'shut-up', 
  \ 'keymap.jump_to_mark': '<c-l>'
\ }
Plug 'ms-jpq/coq.artifacts', { 'branch': 'artifacts' }
Plug 'tmsvg/pear-tree'
  let g:pear_tree_repeatable_expand = 0
  let g:pear_tree_smart_openers = 1
  let g:pear_tree_smart_closers = 1
  let g:pear_tree_smart_backspace = 1
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'sainnhe/gruvbox-material'
  let g:airline_theme = 'gruvbox_material'
  let g:gruvbox_material_palette = 'original'
  let g:gruvbox_material_statusline_style = 'original'
  let g:gruvbox_material_enable_bold = 1
Plug 'vim-airline/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
Plug 'lukas-reineke/indent-blankline.nvim'
  let g:indentLine_char = '▏'
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
set list lcs=tab:\▏\                 " Show tab indentlines
au WinEnter term://* :startinsert    " Always enter terminals in insert mode

" Search tweaks: highlighting, semi-case-insensitive search, etc.
set incsearch showmatch hlsearch ignorecase smartcase

" Visual line guide at 80 characters
set colorcolumn=80
highlight ColorColumn ctermbg=238

" netrw
let g:netrw_liststyle = 3                                 " Default to tree-view
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'  " relative line nums
let g:netrw_banner = 0                                    " Remove top banner

"================================== Mappings ===================================
" Esc/Ctrl+[ clears last search highlighting
nmap <esc> :noh<CR>
nmap <C-[> :noh<CR>

" window/buffer navigation maps for all modes
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
  exec mapcmd . ' <A-d> <C-\><C-n>:bn <BAR> bd #<CR>'
  exec mapcmd . ' <A-D> <C-\><C-n>:bn <BAR> bd! #<CR>'
  exec mapcmd . ' <A-n> <C-\><C-n>:bn<CR>'
  exec mapcmd . ' <A-p> <C-\><C-n>:bp<CR>'
  exec mapcmd . ' <A-s> <C-\><C-n>:split<CR>'
  exec mapcmd . ' <A-v> <C-\><C-n>:vsplit<CR>'
endfor

" Headers
ino ;B <esc>0D80A=<esc>0:exec "normal! 0r" . &commentstring[0]<cr>o<bs>
ino ;b <esc>0D80A-<esc>0:exec "normal! 0r" . &commentstring[0]<cr>o<bs>
ino ;H <esc>:center<cr>2hv0r=A<space><esc>40A=<esc>d80<bar>0:exec "normal! 0r" . &commentstring[0]<cr><esc>o<bs>
ino ;h <esc>:center<cr>2hv0r-A<space><esc>40A-<esc>d80<bar>0:exec "normal! 0r" . &commentstring[0]<cr><esc>o<bs>

" Compile code/documents, etc
nn <leader>cc :w<CR> :exec '!compile "%:p"'<CR>

" Start terminals
nn <leader>tt :split term://zsh<CR><C-\><C-n><C-w>k
nn <leader>tp :split term://python<CR><C-\><C-n><C-w>k
nn <leader>tr :split term://radian<CR><C-\><C-n><C-w>k

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
au FileType sh,bash,zsh,tex ino ;s $
for mapcmd in ['ino', 'tno']
  exec 'au FileType r,rmd ' . mapcmd . ' ;; <-'
  exec 'au FileType r,rmd ' . mapcmd . ' ;n \|>'
  exec 'au FileType r,rmd ' . mapcmd . ' ;m %>%'
  exec 'au FileType r,rmd ' . mapcmd . ' ;in %in%'
  exec 'au FileType r,rmd ' . mapcmd . ' ;: %%'
  exec 'au FileType r,rmd ' . mapcmd . ' ;: $'
endfor
au FileType python ino ;r ->
au FileType markdown,rmd ino ;e **<left>
au FileType markdown,rmd ino ;H <esc>yypv$r=o
au FileType markdown,rmd ino ;h <esc>yypv$r-o
au FileType tex,markdown nn <leader>cc :w<CR> :exec '!compile "%:p" "'.input('What type of document would you like to compile? Choose from `h` for html, `p` for pdf, `d` for docx, or `x` for a xelatex pdf: ').'"'<CR>
au FileType tex ino ;; \

"============================ Additional settings ==============================
lua require('config')

" Windows-specific configs
if has("win64") || has("win32") || has("win16")
  exec 'source ' . stdpath("config") . '\win.vim'
endif

" Work-specific configs
if !empty(glob(stdpath("config") . '/work.vim'))
  exec 'source ' . stdpath("config") . '/work.vim'
endif

