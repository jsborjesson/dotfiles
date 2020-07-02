nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gc :vert :Git commit -v<CR>
nnoremap <Leader>gd :Gvdiffsplit<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gs :Git<CR>

nnoremap <Leader>gh :Gbrowse<CR>
xnoremap <Leader>gh :Gbrowse<CR>

" Quickly commit the current file in the wiki
nnoremap <Leader>gw :Gwrite<CR>:Git commit -m "Update <C-R>=strftime('%F %T')<CR>"<CR>
