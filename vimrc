" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on " required

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

" git
Bundle 'tpope/vim-fugitive'
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>

" whitespace
Bundle 'bronson/vim-trailing-whitespace'
nmap <leader>fw :FixWhitespace<cr>

" multiple cursors - the best feature of sublime I can't live without
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-d>'

" NERDTree
Bundle 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=1
nmap <leader>p :NERDTree<cr>

" theme
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans
set guifont=Source\ Code\ Pro\ for\ Powerline:h12

Bundle 'bling/vim-airline'
let g:airline_powerline_fonts=1
set laststatus=2  " Always show status line


" config
let mapleader=","
nmap <space> :
set noesckeys " no delay on esc
map Q <Nop>
map K <Nop>

" make backspace work as expected
set backspace=indent,eol,start

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

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
set smartcase

