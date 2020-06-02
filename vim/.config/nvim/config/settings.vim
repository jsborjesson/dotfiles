set shiftround " Snap to indentation multiples when indenting
set mouse=a
set number
set nowrap

set splitright
set splitbelow


set ignorecase " Case insensitive search
set smartcase  " When an upper case character is typed, make it strict

" Be totally case insensitive in command mode though.
"
" Lets you type :plug<Tab>i<Tab> to get :PlugInstall.
" This would otherwise insist on you capitalizing the I yourself since the P
" would be capitalized and turn the case insensitivity off.
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" Make tab characters stand out
set list
set listchars=tab:>-
highlight Whitespace guifg=darkgray ctermfg=darkgray


" :terminal settings
augroup terminal
    autocmd!

    autocmd TermOpen * setlocal nonumber
augroup END
