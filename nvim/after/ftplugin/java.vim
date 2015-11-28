set makeprg=javac\ %

" Run the program
nmap <Leader>r :make<CR>:!java -cp %:p:h %:t:r<CR>
