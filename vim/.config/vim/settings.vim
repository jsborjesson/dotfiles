" Minimal Vim Settings
" Essential vim-compatible configuration

" Syntax highlighting
syntax on

" Basic display
set number
set wrap

" Indentation
set expandtab    " Use spaces
set shiftwidth=4 " Use 4 spaces
set tabstop=8    " Display tabs as 8 spaces
set shiftround   " Snap to multiples of shiftwidth when indenting

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Allow switching buffers without saving
set hidden

" More natural splits
set splitright
set splitbelow
