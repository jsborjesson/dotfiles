set mouse=a
set number
set nowrap

" More natural splits
set splitright
set splitbelow

" Allow switching buffers without saving
set hidden

" Default indentation
set expandtab    " Use spaces
set shiftwidth=4 " Use 4 spaces
set tabstop=8    " Display tabs as 8 spaces
set shiftround   " Snap to multiples of shiftwidth when indenting

" Spell checking
set spelllang=en,sv
set spellfile=~/.config/nvim/spell/en.utf-8.add,~/.config/nvim/spell/sv.utf-8.add

" Persist undo history between sessions
set undodir=~/.config/nvim/undo
set undofile


" Searching
set ignorecase         " Case insensitive search
set smartcase          " When an upper case character is typed, make it strict
set inccommand=nosplit " Interactively show search-results when substituting

" Be totally case insensitive in command mode though.
"
" Lets you type :pl<Tab>i<Tab> to get :PlugInstall.
" This would otherwise insist on you capitalizing the I yourself since the P
" would be capitalized and turn the case insensitivity off.
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" :terminal settings
augroup terminal
    autocmd!

    autocmd TermOpen * setlocal nonumber
augroup END
