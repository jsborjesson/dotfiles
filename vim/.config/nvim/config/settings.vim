set shiftround " Snap to indentation multiples when indenting
set mouse=a
set number


augroup terminal
    autocmd!

    autocmd TermOpen * setlocal nonumber
augroup END
