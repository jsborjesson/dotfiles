set shiftround " Snap to indentation multiples when indenting
set mouse=a
set number
set nowrap

set splitright
set splitbelow

" Make tab characters stand out
set list
set listchars=tab:>-
highlight Whitespace guifg=darkgray ctermfg=darkgray


augroup terminal
    autocmd!

    autocmd TermOpen * setlocal nonumber
augroup END
