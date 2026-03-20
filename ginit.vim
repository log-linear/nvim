" Enable mouse
set mouse=a

" Set Editor Font
set guifont=JetBrainsMonoNL\ Nerd\ Font\ Mono:h15

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

set title

augroup dirchange
    autocmd!
    autocmd DirChanged * let &titlestring=v:event['cwd']
augroup END

if exists("g:neovide")
  let g:neovide_input_macos_option_key_is_meta = 'only_right'
endif
