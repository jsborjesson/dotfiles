colorscheme onedark

" No matter the theme, diffs should always be red and green
highlight diffAdded ctermfg=green
highlight diffRemoved ctermfg=red
highlight diffFile ctermfg=yellow

set statusline=%f\ %y%=%l:%c

" Make whitespace characters stand out
set list
set listchars=tab:>-
highlight Whitespace guifg=0f0f0f ctermfg=0f0f0f


" Highlight EOL whitespace
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight TrailingWhitespace ctermbg=darkred guibg=darkred
match TrailingWhitespace /\s\+$/

augroup trailing_whitespace
    autocmd!

    " https://vim.fandom.com/wiki/Highlight_unwanted_spaces
    autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
    autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match TrailingWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END


" Find out the highlighting group under the cursor
function! HighlightGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
command! HighlightGroup call HighlightGroup()
