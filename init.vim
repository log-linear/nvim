"============================== General settings ===============================
let mapleader=" "                    " remap <leader>
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
set list lcs=tab:\▏\                 " Show tab indentlines
au WinEnter term://* :startinsert    " Always enter terminals in insert mode

" search tweaks - highlighting, semi-case-insensitive search, etc
set incsearch showmatch hlsearch ignorecase smartcase

" Visual line guide at 80 characters
set colorcolumn=80
highlight ColorColumn ctermbg=238

" netrw
let g:netrw_liststyle = 3                                 " Default to tree-view
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'  " relative line nums
let g:netrw_banner = 0                                    " Remove top banner

"============================= Filetype settings ===============================
augroup ft_conf
  au!
  " Shell
  au FileType sh,bash,zsh setlocal expandtab shiftwidth=2 tabstop=2
  au FileType sh,bash,zsh ino ;s $
  " R
  au FileType r,rmd setlocal expandtab shiftwidth=2 tabstop=2 autoindent cindent
  let r_indent_align_args = 0
  let g:r_indent_op_pattern = get(g:, 'r_indent_op_pattern',
    \ '\(&\||\|+\|-\|\*\|/\|=\|\~\|%\|->\||>\)\s*$')  " Support |> indenting
  for mapcmd in ['ino', 'tno']
    execute 'au FileType r,rmd ' . mapcmd . ' ;; <-'
    execute 'au FileType r,rmd ' . mapcmd . ' ;n \|>'
    execute 'au FileType r,rmd ' . mapcmd . ' ;m %>%'
    execute 'au FileType r,rmd ' . mapcmd . ' ;in %in%'
    execute 'au FileType r,rmd ' . mapcmd . ' ;: %%'
  endfor
  " Python
  au FileType python ino ;c """<CR>"""<esc>ko
  au FileType python ino ;r ->
  let g:pyindent_open_paren=4
  " Markdown
  let g:markdown_fenced_languages = ['python', 'r', 'sh', 'bash', 'zsh', 
    \ 'powershell=ps1', 'sql', 'json', 'html']
  au FileType markdown,rmd ino ;c ``<left>
  au FileType markdown,rmd ino ;C ```<CR>```<esc>k$a
  au FileType markdown,rmd ino ;e **<left>
  au FileType markdown,rmd ino ;H <esc>yypv$r=o
  au FileType markdown,rmd ino ;h <esc>yypv$r-o
  " TeX
  au FileType tex ino ;; \
  au FileType tex ino ;s $
  " Miscellaneous
  au FileType vim setlocal tw=0 shiftwidth=2 tabstop=2
  au BufEnter *.tsv setlocal noexpandtab
augroup END

"==================================== Maps =====================================
" Esc/Ctrl+[ clears last search highlighting
nn <esc> :noh<CR>
nn <C-[> :noh<CR>

" Multi-mode mappings
for mapcmd in ['nn', 'ino', 'vn', 'tno']
  " Remap window navigation to ALT + hjkl
  execute mapcmd . ' <A-h> <C-\><C-n><C-w>h'
  execute mapcmd . ' <A-j> <C-\><C-n><C-w>j'
  execute mapcmd . ' <A-k> <C-\><C-n><C-w>k'
  execute mapcmd . ' <A-l> <C-\><C-n><C-w>l'
  " Remap window movement ALT + HJKL
  execute mapcmd . ' <A-H> <C-\><C-n><C-w>H'
  execute mapcmd . ' <A-J> <C-\><C-n><C-w>J'
  execute mapcmd . ' <A-K> <C-\><C-n><C-w>K'
  execute mapcmd . ' <A-L> <C-\><C-n><C-w>L'
  " Remap window adjustment to ALT + <-+>
  execute mapcmd . ' <A-,> <C-\><C-n><C-w>:vertical resize -3<CR>'
  execute mapcmd . ' <A--> <C-\><C-n><C-w>:resize -3<CR>'
  execute mapcmd . ' <A-=> <C-\><C-n><C-w>:resize +3<CR>'
  execute mapcmd . ' <A-.> <C-\><C-n><C-w>:vertical resize +3<CR>'
  execute mapcmd . ' <A-0> <C-\><C-n><C-w>='
  " Alt + q to close windows
  execute mapcmd . ' <A-q> <C-\><C-n>:q<CR>'
  execute mapcmd . ' <A-Q> <C-\><C-n>:q!<CR>'
  " netrw
  execute mapcmd . ' <A-f> <C-\><C-n>:Vexplore<CR>'
  " Buffer navigation/management
  execute mapcmd . ' <A-d> <C-\><C-n>:bn <BAR> bd #<CR>'
  execute mapcmd . ' <A-D> <C-\><C-n>:bn <BAR> bd! #<CR>'
  execute mapcmd . ' <A-n> <C-\><C-n>:bn<CR>'
  execute mapcmd . ' <A-p> <C-\><C-n>:bp<CR>'
  execute mapcmd . ' <A-s> <C-\><C-n>:split<CR>'
  execute mapcmd . ' <A-v> <C-\><C-n>:vsplit<CR>'
endfor

" Headers
ino ;B <esc>0D80A=<esc>0:execute "normal! 0r" . &commentstring[0]<cr>o<bs>
ino ;b <esc>0D80A-<esc>0:execute "normal! 0r" . &commentstring[0]<cr>o<bs>
ino ;H <esc>:center<cr>2hv0r=A<space><esc>40A=<esc>d80<bar>0:execute "normal! 0r" . &commentstring[0]<cr><esc>o<bs>
ino ;h <esc>:center<cr>2hv0r-A<space><esc>40A-<esc>d80<bar>0:execute "normal! 0r" . &commentstring[0]<cr><esc>o<bs>

" Compile code/documents, etc
nn <leader>cc :w<CR> :execute '!compile "%:p"'<CR>
au FileType tex,markdown nn <leader>cc :w<CR> :execute '!compile "%:p" "'.input('What type of document would you like to compile? Choose from `h` for html, `p` for pdf, `d` for docx, or `x` for a xelatex pdf: ').'"'<CR>

" Start terminals
nn <leader>tt :split term://zsh<CR><C-\><C-n><C-w>k
nn <leader>tp :split term://python<CR><C-\><C-n><C-w>k
nn <leader>tr :split term://radian<CR><C-\><C-n><C-w>k

"================================== Plugins ====================================
" Install vim-plug if not already available
if empty(stdpath("config") . '/site/autoload/plug.vim')
  silent !curl -fLo stdpath("config") . '/site/autoload/plug.vim' --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
au VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugin settings that need to be set before load
let g:gruvbox_material_palette = 'original'
let g:gruvbox_material_statusline_style = 'original'
let g:gruvbox_material_enable_bold = 1

" Load plugins
call plug#begin(stdpath("config") . '/plugged')
  Plug 'tpope/vim-commentary'                         " easy code commenting
  Plug 'tpope/vim-fugitive'                           " git integration
  Plug 'mhinz/vim-signify'                            " git diff markers
  Plug 'karoliskoncevicius/vim-sendtowindow'          " Basic REPLing
  Plug 'tpope/vim-surround'                           " surround text objects
  Plug 'tpope/vim-repeat'                             " repeat plugin commands
  Plug 'junegunn/vim-easy-align'                      " Text alignment
  Plug 'junegunn/fzf'                                 " FZF, needed on Windows
  Plug 'junegunn/fzf.vim'                             " fzf functions
  Plug 'neovim/nvim-lspconfig'                        " Language Server Protocol
  Plug 'ray-x/lsp_signature.nvim'                     " Function param popup
  Plug 'ms-jpq/coq_nvim', { 'branch': 'coq' }         " Auto-completion
  Plug 'ms-jpq/coq.artifacts',                        " Auto-completion snippets
    \ { 'branch': 'artifacts' }
  Plug 'tmsvg/pear-tree'                              " Auto-closing pairs
  Plug 'nvim-treesitter/nvim-treesitter',             " syntax highlighting, etc
    \ { 'do': ':TSUpdate' }  " Update on start
  Plug 'vim-airline/vim-airline'                      " status bar
  Plug 'sainnhe/gruvbox-material'                     " theme
  Plug 'lukas-reineke/indent-blankline.nvim'          " Visual line indents
  Plug 'sunjon/shade.nvim'                            " Dim inactive windows
  Plug 'ryanoasis/vim-devicons'                       " Icons, ALWAYS LOAD LAST
call plug#end()

"---------------------------------- coq_nvim -----------------------------------
let g:coq_settings = {
  \ 'auto_start': 'shut-up', 
  \ 'keymap.jump_to_mark': '<c-l>'
\ }

"--------------------------------- pear-tree -----------------------------------
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"------------------------------ vim-sendtowindow -------------------------------
let g:sendtowindow_use_defaults=0
nmap <A-CR> <Plug>SendDown
vmap <A-CR> <Plug>SendDownV
imap <A-CR> <Esc><Plug>SendDown

"---------------------------------- fzf.vim ------------------------------------
nn <leader>/f :Files<CR>
nn <leader>/g :GFiles<CR>
nn <leader>/c :BCommits<CR>
nn <leader>/h :Help<CR>
nn <leader>/s :History<CR>
nn <leader>// :BLines<CR>
nn <leader>/m :Maps<CR>
nn <leader>/t :Filetypes<CR>

"------------------------------- vim-easy-align --------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-------------------------------- vim-airline ----------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"--------------------------------- indentline ----------------------------------
let g:indentLine_char = '▏'

"---------------------------------- gruvbox ------------------------------------
colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'
hi Function guifg=#98971a guibg=NONE gui=bold cterm=bold  " function hi group
hi String guifg=#8ec07c guibg=NONE                        " string hi group

"-------------------------------- vim-signify ----------------------------------
map <leader>uh :SignifyHunkUndo<CR>

"================================ lua configs ==================================
lua require('config')

"========================== Windows-specific configs ===========================
if has("win64") || has("win32") || has("win16")
  exec 'source ' . stdpath("config") . '\win.vim'
endif

"=========================== Work-specific configs =============================
if !empty(glob(stdpath("config") . '/work.vim'))
  exec 'source ' . stdpath("config") . '/work.vim'
endif

