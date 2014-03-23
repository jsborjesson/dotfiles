" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on " required

" bundles
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'

" theme
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
let g:airline_powerline_fonts=1

" config
let mapleader=","
nmap <space> :
set noesckeys " no delay on esc
map Q <Nop>
map K <Nop>
autocmd BufWritePre * :%s/\s\+$//e " trim trailing whitespace


" make backspace work as expected
set backspace=indent,eol,start

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

set laststatus=2  " Always show status line

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



