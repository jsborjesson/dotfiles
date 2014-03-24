" Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/tComment'
Bundle 'airblade/vim-gitgutter'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'itspriddle/vim-marked'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'bling/vim-airline'
Bundle 'nanotech/jellybeans.vim'

" Enable filetypes
syntax on
filetype on
filetype plugin indent on

" theme
colorscheme jellybeans
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set laststatus=2  " Always show status line
let g:airline_powerline_fonts=1

let mapleader=","

" git
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>

" whitespace
nmap <leader>fw :FixWhitespace<cr>

" multiple cursors - the best feature of sublime I can't live without
let g:multi_cursor_next_key='<C-d>'

" NERDTree
set autochdir
let NERDTreeQuitOnOpen=1
let NERDTreeChDirMode=2
nnoremap <leader>p :NERDTree .<cr>

" indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

" line numbers
set number
set relativenumber

" searching
set incsearch
set ignorecase

" config
set nocompatible
set ttimeoutlen=1 " fixes delay on escape without breaking arrowkeys like noesckeys
set backspace=indent,eol,start " make backspace work as expected
nmap <space> :
map Q <Nop>
map K <Nop>
