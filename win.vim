"======================= Windows-specific configuration  =======================

"------------------------------- Mapping fixes ---------------------------------
nn <leader>tt :15new<CR><C-\><C-n>:call termopen("powershell")<CR><C-\><C-n><C-w>k
au FileType r nmap <CR><CR> :w<CR>:15sp<CR>:term Rscript "%:p"<CR>
au FileType rmd nmap <CR><CR> :w<CR>:15sp<CR>:term Rscript -e "rmarkdown::render(r'(%:p)')"<CR>
au FileType python nmap <CR><CR> :w<CR>:15sp<CR>:term python "%"<CR>
au BufEnter *.md setlocal conceallevel=0
au FileType markdown nmap <Cr>h :w! \| !pandoc "%" -o "%:r.html" && start chrome "%:p:r.html"<CR>
au FileType markdown nmap <Cr>w :w! \| !pandoc "%" -o "%:r.docx" && start WINWORD.exe "%:p:r.docx"<CR>
au FileType markdown nmap <Cr>p :w! \| !pandoc "%" -o "%:r.pdf" && start sumatrapdf "%:p:r.pdf"<CR>
au FileType markdown nmap <Cr>x :w! \| !pandoc "%" --pdf-engine=xelatex -o "%:r.pdf" && start sumatrapdf "%:p:r.pdf"<CR>
au FileType tex nmap <CR>p :w<cr> :!pdflatex "%:r.tex" && rm "%:r.aux" "%:r.log" && start sumatrapdf "%:p:r.pdf"<CR>
au FileType tex nmap <CR>x :w<cr> :!xelatex "%:r.tex" && rm "%:r.aux" "%:r.log" && start sumatrapdf "%:p:r.pdf"<CR>

