colorscheme onedark

" No matter the theme, diffs should always be red and green
highlight diffAdded ctermfg=green
highlight diffRemoved ctermfg=red
highlight diffFile ctermfg=yellow

" Find out the highlighting group under the cursor
function! HighlightGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
command! HighlightGroup call HighlightGroup()
