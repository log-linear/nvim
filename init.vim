"============================== General settings ===============================
set cursorline
set clipboard+=unnamedplus
set splitbelow splitright
set mouse=a
set scrolloff=3 sidescroll=3
set number relativenumber
set signcolumn=yes:2
set autoindent smartindent
set tabstop=4 shiftwidth=4
set termguicolors
set list lcs+=tab:\▸\ ,extends:→,precedes:←,nbsp:·,trail:·
au WinEnter term://* :startinsert
au TextYankPost * silent! lua vim.highlight.on_yank({timeout=250})
set incsearch showmatch hlsearch ignorecase smartcase
set colorcolumn=80
set nowrap
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let mapleader=" "

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
nn <leader>ts :15new<CR><C-\><C-n>:call termopen("usql")<CR><C-\><C-n><C-w>k
nn <Leader>ve <esc>:Vexplore<CR>
nn <leader>cd :cd %:p:h<CR>:pwd<CR>
nn <leader>.. :cd ..<CR>:pwd<CR>
set wildcharm=<C-Z>
cno <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cno <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cno <expr> <PageUp> wildmenumode() ?
\ "\<left>\<left>\<left>\<left>\<left>\<left>\<left>\<left>" : "\<PageUp>"
cno <expr> <PageDown> wildmenumode() ?
\ "\<right>\<right>\<right>\<right>\<right>\<right>\<right>\<right>" : "\<PageDown>"
cno <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cno <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
cno <expr> <space> wildmenumode() ? "<C-y>" : "<space>"

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
  exec mapcmd . ' <A-c> <C-\><C-n>:close<CR>'
  exec mapcmd . ' <A-d> <C-\><C-n>:bp <BAR> bd #<CR>'
  exec mapcmd . ' <A-D> <C-\><C-n>:bp <BAR> bd! #<CR>'
  exec mapcmd . ' <A-n> <C-\><C-n>:bn<CR>'
  exec mapcmd . ' <A-p> <C-\><C-n>:bp<CR>'
  exec mapcmd . ' <A-s> <C-\><C-n>:sp<CR>:bp<CR>'
  exec mapcmd . ' <A-v> <C-\><C-n>:vs<CR>:bp<CR>'
endfor

"=========================== File-specific settings ============================
let g:pyindent_open_paren=shiftwidth()
let r_indent_align_args=0
let g:r_indent_op_pattern=get(g:, 'r_indent_op_pattern',
\ '\(&\||\|+\|-\|\*\|/\|=\|\~\|%\|->\||>\)\s*$')

au FileType sh,bash,zsh,vim,lua,r,rmd setlocal expandtab shiftwidth=2 tabstop=2
au FileType python,markdown setlocal expandtab shiftwidth=4 tabstop=4
au FileType markdown setlocal wrap linebreak
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
au FileType tex ino ;; \
au FileType tex,markdown nn <CR><CR> :w<CR> :execute '!compile "%:p" "'.input('What type of document would you like to compile? Choose from `h` for html, `p` for pdf, `d` for docx, or `x` for a xelatex pdf: ').'"'<CR>

"================================== Plug-ins ===================================
if !empty(glob(stdpath('config') . '/plugins.vim'))
  exec 'source ' . stdpath('config') . '/plugins.vim'
endif

"============================ Additional settings ==============================
if has("win64") || has("win32") || has("win16")
  exec 'source ' . stdpath("config") . '/win.vim'
endif

if !empty(glob(stdpath("config") . '/work.vim'))
  exec 'source ' . stdpath("config") . '/work.vim'
endif

