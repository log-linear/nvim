" Windows-specific configuration ==============================================

let user = substitute(substitute(system('whoami'), '\n\+$', '', ''), '^.\+\\', '', '')

" Mapping fixes
map <leader>tt :T powershell<CR><CR><C-\><C-n><C-w>k
map <leader>tp :T python<CR><CR><C-\><C-n><C-w>k
map <leader>tr :T radian<CR><CR><C-\><C-n><C-w>k

au FileType r nmap <leader>cc :w<CR> :!Rscript "%:p"<CR>
au FileType rmd nmap <leader>cc :w<CR> :!Rscript -e "rmarkdown::render(r'(%:p)')"<CR>
au FileType python nmap <leader>cc :w<CR> :!python "%"<CR>
" Markdown
au BufEnter *.md setlocal conceallevel=0
au FileType markdown nmap <leader>ch :w! \| !pandoc "%" -o "%:r.html" && start chrome "%:p:r.html"<CR>
au FileType markdown nmap <leader>cw :w! \| !pandoc "%" -o "%:r.docx" && start WINWORD.exe "%:p:r.docx"<CR>
au FileType markdown nmap <leader>cp :w! \| !pandoc "%" -o "%:r.pdf" && start sumatrapdf "%:p:r.pdf"<CR>
au FileType markdown nmap <leader>cx :w! \| !pandoc "%" --pdf-engine=xelatex -o "%:r.pdf" && start sumatrapdf "%:p:r.pdf"<CR>
au FileType tex nmap <leader>cp :w<cr> :!pdflatex "%:r.tex" && rm "%:r.aux" "%:r.log" && start sumatrapdf "%:p:r.pdf"<cr>
au FileType tex nmap <leader>cx :w<cr> :!xelatex "%:r.tex" && rm "%:r.aux" "%:r.log" && start sumatrapdf "%:p:r.pdf"<cr>

